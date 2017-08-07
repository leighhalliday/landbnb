Types::AuthProviderSignupData = GraphQL::InputObjectType.define do
  name 'AuthProviderSignupData'

  argument :email, Types::AuthProviderEmailInput
end
