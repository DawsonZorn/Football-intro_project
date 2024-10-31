class Coach < ApplicationRecord
  belongs_to :team
  has_many :players, through: :team
  validates :name, presence: true
end
