class Mutations::BookRental < GraphQL::Function
  argument :rental_id, !types.Int
  argument :start_date, !types.String
  argument :stop_date, !types.String
  argument :guests, !types.Int

  type Types::BookingType

  def call(_obj, args, ctx)
    if ctx[:current_user].blank?
      raise GraphQL::ExecutionError.new("Authentication required")
    end

    rental = Rental.find(args[:rental_id])

    booking = rental.bookings.create!(
      user: ctx[:current_user],
      start_date: args[:start_date],
      stop_date: args[:stop_date],
      guests: args[:guests]
    )

    booking
  rescue ActiveRecord::RecordNotFound => e
    GraphQL::ExecutionError.new("No Rental with ID #{args[:rental_id]} found.")
  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
  end
end
