if Rails.env.development?
  GraphiQL::Rails.config.headers['Authorization'] = -> (_ctx) {
    "bearer #{ENV['JWT_TOKEN']}"
  }
end
