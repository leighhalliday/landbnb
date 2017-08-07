Types::BookingType = GraphQL::ObjectType.define do
  name 'Booking'

  field :id, !types.ID
  field :start_date, !types.String
  field :stop_date, !types.String
  field :review_score, types.Int
  field :review_comments, types.String
  field :reviewed_at, types.String

  field :rental, -> { Types::RentalType }
  field :user, -> { Types::UserType }
end
