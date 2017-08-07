Types::BookingType = GraphQL::ObjectType.define do
  name 'Booking'

  field :id, !types.ID
  field :start_date, !types.String
  field :stop_date, !types.String
  field :review_score, types.Int
  field :review_comments, types.String
  field :reviewed_at, types.String

  field :rental, Types::RentalType do
    preload :rental
    resolve -> (obj, args, context) { obj.rental }
  end
  field :guest, Types::UserType do
    preload :user
    resolve -> (obj, args, context) { obj.user }
  end
end
