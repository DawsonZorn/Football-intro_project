class Season < ApplicationRecord
  has_many :leagues
  has_many :matches, through: :leagues

  validates :year, presence: true, uniqueness: true
end
