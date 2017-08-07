Types::RentalType = GraphQL::ObjectType.define do
  name 'Rental'

  field :id, !types.ID
  field :rental_type, !types.String
  field :accommodates, !types.Int
  field :bathrooms, !types.Int
  field :bedrooms, !types.Int
  field :beds, !types.Int
  field :nightly_cost, !types.Float
  field :description, types.String
  field :latitude, types.Float
  field :longitude, types.Float
  field :street1, !types.String
  field :street2, types.String
  field :city, !types.String
  field :province, types.String
  field :country, !types.String
  field :postal_code, types.String

  field :owner, Types::UserType do
    resolve -> (obj, args, context) { RecordLoader.for(User).load(obj.user_id) }
  end
  field :bookings, !types[Types::BookingType] do
    preload :bookings
    resolve -> (obj, args, ctx) { obj.bookings }
  end
end
