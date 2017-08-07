require 'rails_helper'

describe Mutations::SignInUser do
  def perform(args = {})
    described_class.new.call(nil, args, {current_user: nil})
  end

  let!(:user) {
    User.create!(name: 'Test User', email: 'test@email.com', password: 'secret')
  }

  describe 'authenticates user' do
    it 'creates token when valid' do
      result = perform(
        email: {
          email: user.email,
          password: user.password
        }
      )

      expect(result.token).to be_present
      expect(result.user).to eq(user)
    end

    it 'is nil when invalid email' do
      result = perform(
        email: {
          email: 'invalid@email.com',
          password: user.password
        }
      )

      expect(result).to be_nil
    end

    it 'is nil when invalid password' do
      result = perform(
        email: {
          email: user.email,
          password: 'invalid'
        }
      )

      expect(result).to be_nil
    end
  end
end
