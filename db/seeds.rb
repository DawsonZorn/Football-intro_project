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


# Clear existing records
Team.destroy_all
Player.destroy_all
Coach.destroy_all
Competition.destroy_all
Position.destroy_all

# Create positions
positions = []
5.times do
  positions << Position.create(name: Faker::Sports::Football.position)
end

# Create competitions
competitions = []
5.times do
  competitions << Competition.create(name: Faker::Sports::Football.competition)
end

# Create teams and their associated coaches and players
teams = []
50.times do
  team_name = Faker::Sports::Football.team
  team = Team.create(name: team_name)

  # Creates a unique coach for each team
  coach_name = Faker::Sports::Football.coach
  coach = Coach.create(name: coach_name, team: team)

  # Create unique players for the team
  5.times do
    player_name = Faker::Sports::Football.player
    position = positions.sample # Pick a random position

    # Create the player and associate with the team and position
    Player.create(name: player_name, team: team, position: position, coach_id: coach.id)
  end

  teams << team
end

puts "#{teams.size} teams created! yippeee"
