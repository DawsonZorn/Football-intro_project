# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'httparty'

BASE_URL = "https://raw.githubusercontent.com/openfootball/football.json/master"

# Fetch and store data in the database
def fetch_and_seed_league_data
  league_codes = [ 'en.1', 'en.2', 'en.3', 'en.4', 'at.1', 'at.2', 'de.1', 'cl' ] # league codes for division names
  year_ranges = (2010..2024).to_a # range of seasons
  league_codes.each do |league_code|
    year_ranges.each do |year|
      # Construct the URL for each league and year combination
      url = "#{BASE_URL}/#{year}-#{(year + 1) % 100}/#{league_code}.json"

      # Try to retrieve data
      response = HTTParty.get(url)
      next unless response.success? # Skip if the data isn't available

      data = response.parsed_response

      # Find or create league
      if data['name'] && data['country']
        league = League.find_or_create_by(name: data['name'], code: league_code, country: data['country'])

         # Match year format in name if it exists
         season_year_match = data['name'].match(/\d{4}\/\d{2}/)
         next unless season_year_match # Skip if no year format is found

         season_year = season_year_match[0]
         season = league.seasons.find_or_create_by(year: season_year)

      # Seed matches and clubs if they dont already exist
      data['matches'].each do |match_data|
        team1 = Club.find_or_create_by(name: match_data['team1'])
        team2 = Club.find_or_create_by(name: match_data['team2'])

        Match.create(
          round: match_data['round'],
          date: match_data['date'],
          time: match_data['time'],
          team1: team1,
          team2: team2,
          league: league,
          season: season,
          ht_team1: match_data.dig('score', 'ht', 0),
          ht_team2: match_data.dig('score', 'ht', 1),
          ft_team1: match_data.dig('score', 'ft', 0),
          ft_team2: match_data.dig('score', 'ft', 1)
        )
      end
      end
  end
end
end
fetch_and_seed_league_data
