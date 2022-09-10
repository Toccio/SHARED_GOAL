class ClassroomCategory < ApplicationRecord
  belongs_to :instrument
  has_many :classroom, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name],
    using: {
      tsearch: { prefix: true }
    }
end
