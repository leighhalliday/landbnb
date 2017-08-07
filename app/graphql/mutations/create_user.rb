class Mutations::CreateUser < GraphQL::Function
  argument :name, !types.String
  argument :authProvider, !Types::AuthProviderSignupData

  type Types::AuthenticateType

  def call(_obj, args, _ctx)
    user = User.create!(
      name: args[:name],
      email: args[:authProvider][:email][:email],
      password: args[:authProvider][:email][:password]
    )

    OpenStruct.new({
      token: AuthToken.token(user),
      user: user
    })
  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
  end
end
