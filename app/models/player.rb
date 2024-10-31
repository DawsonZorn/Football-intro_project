class Player < ApplicationRecord
  belongs_to :team
  belongs_to :position
  belongs_to :coach, class_name: "Coach", foreign_key: "coach_id"
  has_and_belongs_to_many :competitions
  validates :name, presence: true
end
