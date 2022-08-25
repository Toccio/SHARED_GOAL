class List < ApplicationRecord
  has_many :skills, dependent: :destroy
  has_many :classrooms, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  validates :photo, presence: true


  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name],
  #   # associated_against: {
  #   #   list: [ :name, :description ]
  #   # },
    using: {
      tsearch: { prefix: true }
    }


  #   include PgSearch::Model
  # pg_search_scope :global_search, against: {
  #   name: 'A',
  #   description: 'B'
  # },

  # using: {
  #   tsearch: { prefix: true }
  # }

end
