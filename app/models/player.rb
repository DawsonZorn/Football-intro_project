class Player < ApplicationRecord
  belongs_to :team
  belongs_to :position
  belongs_to :coach, class_name: "Coach", foreign_key: "coach_id"
  validates :name, presence: true
end
