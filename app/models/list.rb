class List < ApplicationRecord
  has_many :skills, dependent: :destroy
  has_many :classrooms, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  validates :photo, presence: true
  has_many :classroom_categories, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name],
    using: {
      tsearch: { prefix: true }
    }
end
