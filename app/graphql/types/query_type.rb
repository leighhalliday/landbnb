Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :rentals, !types[Types::RentalType] do
    resolve -> (obj, args, ctx) {
      Rental.all
    }
  end
end
