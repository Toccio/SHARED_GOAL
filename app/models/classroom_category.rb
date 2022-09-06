class ClassroomCategory < ApplicationRecord
  belongs_to :list
  has_many :classroom, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :instrument],
    using: {
      tsearch: { prefix: true }
    }
end
