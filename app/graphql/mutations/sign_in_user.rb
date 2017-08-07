class Mutations::SignInUser < GraphQL::Function
  argument :email, !Types::AuthProviderEmailInput

  type Types::AuthenticateType

  def call(obj, args, ctx)
    input = args[:email]
    return unless input

    user = User.find_by(email: input[:email])
    return unless user
    return unless user.authenticate(input[:password])

    OpenStruct.new({
      token: AuthToken.token(user),
      user: user
    })
  end
end
