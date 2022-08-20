class Classroom < ApplicationRecord
  belongs_to :user
  belongs_to :list
  has_many :bookings, dependent: :destroy
end
