class Instrument < ApplicationRecord
  belongs_to :list
  has_many :classroom_categories, dependent: :destroy
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name],
    using: {
      tsearch: { prefix: true }
    }
end
