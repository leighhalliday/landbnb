class User < ApplicationRecord
  has_secure_password

  has_many :rentals
  has_many :bookings
  has_many :rentals

  validates :name, :password_digest, presence: true
  validates :email, presence: true, uniqueness: true
end
