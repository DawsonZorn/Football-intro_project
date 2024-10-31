class Match < ApplicationRecord
  belongs_to :team1, class_name: "Team"
  belongs_to :team2, class_name: "Team"
  belongs_to :league
  belongs_to :season

  validates :team1, :team2, :date, :round, presence: true
  validates :ht_team1, :ht_team2, :ft_team1, :ft_team2, numericality: { only_integer: true, allow_nil: true }
  validate :different_teams

  private

  def different_teams
    errors.add(:team2, "must be different from team1") if team1 == team2
  end
end
