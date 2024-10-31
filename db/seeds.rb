# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "faker"

# URL for the specific season data
url = 'https://raw.githubusercontent.com/openfootball/football.json/master/2013-14/en.1.json'

# Fetch the data
response = HTTParty.get(url)

# Check if the response was successful
if response.success?
  data = JSON.parse(response.body)

  # Assuming the structure of the JSON, adapt accordingly
  league_name = data['name'] # Get league name
  league = League.find_or_create_by(name: league_name)

  # Loop through each round in the rounds array
  data['rounds'].each do |round|
    round_name = round['name']

    # You might want to create a Round model if you haven't done so
    round_record = league.rounds.find_or_create_by(name: round_name)

    # Loop through each match in the matches array
    round['matches'].each do |match|
      # Create or update match records based on the structure
      match_record = round_record.matches.find_or_create_by(
        date: match['date'],
        team1: match['team1'],
        team2: match['team2'],
        score: match['score']['ft'] # Adjust if needed
      )
    end
  end

  puts "Successfully seeded league and matches from #{url}."
else
  puts "Failed to fetch data from #{url}: #{response.code}"
end
