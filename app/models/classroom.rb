class Classroom < ApplicationRecord
  belongs_to :user
  belongs_to :classroom_category
  # belongs_to :list
  has_many :bookings, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  validates :level, presence: true
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
