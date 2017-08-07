if Rails.env.development?
  GraphiQL::Rails.config.headers['Authorization'] = -> (_ctx) {
    "Bearer #{ENV['JWT_TOKEN']}"
  }
end
