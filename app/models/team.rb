class Team < ApplicationRecord
  has_many :players
  has_many :coaches
  has_and_belongs_to_many :competitions
  validates :name, presence: true
end
