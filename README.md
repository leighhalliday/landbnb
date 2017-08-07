# Landbnb

This is an example Rails application which implements a GraphQL API.

## Installation

After cloning the repository, run the following commands:
- `bundle install`
- `bundle exec rails db:create`
- `bundle exec rails db:migrate`
- `bundle exec rake db:seed`

The last command will provide you with some sample data to play around with.

## Development

Start the Rails app with `rails server` and you can visit http://localhost:3000/graphiql to explore the API locally.

## Requests requiring authentication

Both the `createUser` and `signInUser` mutations return a `token` field. This is a JWT token which should be submitted in all subsequent requests in the format:

`Authentication: bearer TOKEN_HERE`
