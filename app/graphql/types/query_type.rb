Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :rentals, !types[Types::RentalType] do
    argument :limit, types.Int, default_value: 20, prepare: -> (limit) { [limit, 30].min }
    resolve -> (obj, args, ctx) {
      Rental.limit(args[:limit]).order(id: :desc)
    }
  end
end
