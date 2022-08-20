class List < ApplicationRecord
  has_many :skills, dependent: :destroy
  has_many :classrooms, dependent: :destroy
end
