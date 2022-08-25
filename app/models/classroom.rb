class Classroom < ApplicationRecord
  belongs_to :user
  belongs_to :list
  has_many :bookings, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  validates :level, presence: true

  include PgSearch::Model
  multisearchable against: [:name, :description]

end
