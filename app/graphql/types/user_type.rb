# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :username, String, null: false
    field :email, String, null: false
    field :password, String, null: false
    field :tweets, [ Types::TweetType ], null: true
    field :tweets_count, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def tweets_count
      object.tweets.size
    end
  end
end
