class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_token_authenticatable

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :bookings, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :classrooms, dependent: :destroy
end
