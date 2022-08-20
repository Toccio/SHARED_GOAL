class Skill < ApplicationRecord
  belongs_to :user
  belongs_to :list
  validates :level, presence: true
end
