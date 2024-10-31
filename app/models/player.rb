class Player < ApplicationRecord
  belongs_to :team
  belongs_to :position
  validates :name, presence: true
end
