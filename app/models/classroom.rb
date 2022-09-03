class Classroom < ApplicationRecord
  belongs_to :user
  belongs_to :classroom_category
  has_many :bookings, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  validates :level, presence: true
  has_one_attached :photo

  include PgSearch::Model
  multisearchable against: [:name, :description]
end
