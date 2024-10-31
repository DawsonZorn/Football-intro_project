class League < ApplicationRecord
  belongs_to :season
  has_many :teams
  has_many :matches

  validates :name, presence: true, uniqueness: { scope: :season_id }
end
