Types::UserType = GraphQL::ObjectType.define do
  name 'User'

  field :id, !types.ID
  field :email, !types.String
  field :name, !types.String
  
  field :rentals, -> { !types[Types::RentalType] }
  field :bookings, -> { !types[Types::BookingType] }
end
