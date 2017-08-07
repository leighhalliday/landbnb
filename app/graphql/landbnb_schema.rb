LandbnbSchema = GraphQL::Schema.define do
  max_depth 4

  # mutation(Types::MutationType)
  query(Types::QueryType)
end
