class Match < ApplicationRecord
  belongs_to :team1
  belongs_to :team2
  belongs_to :league
  belongs_to :season
end
