class Rental < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews

  validates :user, :rental_type, :accommodates, :bathrooms,
    :bedrooms, :beds, :nightly_cost, :street1, :city,
    :country, presence: true
end
