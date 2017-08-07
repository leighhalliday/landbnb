# run with `bundle exec rails db:seed`

# clear out existing data
[User, Rental, Booking].each do |model|
  model.delete_all
end

# create some owners
owners = Array(1..15).map do |n|
  User.create!(
    name: Faker::Name.name,
    email: "owner-#{n}@email.com",
    password: 'secret'
  )
end

# create some renters
renters = Array(1..15).map do |n|
  User.create!(
    name: Faker::Name.name,
    email: "renter-#{n}@email.com",
    password: 'secret'
  )
end

# create some rental units + bookings
Array(1..100).each do |n|
  rental = Rental.create!(
    user: owners.sample,
    rental_type: ['house', 'apartment'].sample,
    bathrooms: [1,2,3].sample,
    bedrooms: [1,2,3].sample,
    beds: [1,2,3].sample,
    accommodates: [1,2,3,4,5].sample,
    nightly_cost: [55.75, 100.25, 113].sample,
    description: "Very #{['scenic', 'beautiful','ugly'].sample} view.",
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
    street1: Faker::Address.street_address,
    city: Faker::Address.city,
    province: Faker::Address.state_abbr,
    country: Faker::Address.country_code,
    postal_code: Faker::Address.postcode
  )

  num_bookings = Array(1..10).sample

  Array(1..num_bookings).each do |n|
    booking = Booking.create!(
      user: renters.sample,
      rental: rental,
      guests: [1,2,3].sample,
      start_date: n.days.from_now.to_date,
      stop_date: (n + 3).days.from_now.to_date
    )

    if [true, false].sample
      booking.review_score = [1,2,3,4].sample
      booking.review_comments = "I chose a score of #{booking.review_score}"
      booking.reviewed_at = booking.stop_date.end_of_day
      booking.save!
    end
  end
end
