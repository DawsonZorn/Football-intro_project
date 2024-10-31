class Team < ApplicationRecord
  belongs_to :league
  has_many :matches_as_team1, class_name: "Match", foreign_key: "team1_id"
  has_many :matches_as_team2, class_name: "Match", foreign_key: "team2_id"

  validates :name, presence: true, uniqueness: { scope: :league_id }
end
