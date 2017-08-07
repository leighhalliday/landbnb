Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :signInUser, function: Mutations::SignInUser.new
  field :createUser, function: Mutations::CreateUser.new
end
