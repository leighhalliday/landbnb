Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :rentals, !types[Types::RentalType] do
    resolve -> (obj, args, ctx) {
      Rental.all
    }
  end
end
