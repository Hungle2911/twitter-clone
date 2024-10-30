class UserTest < ActiveSupport::TestCase
  test 'retrieve user info' do
    user = User.create!(username: "Testuser12", email: "testuser@example.com", password: "password")

    query = <<~GQL
      query GetUser($id: ID!) {
        user(id: $id) {
          id
          username
          email
        }
      }
    GQL

    # Execute the query, passing in the user ID as a variable
    result = TwitterCloneSchema.execute(query, variables: { id: user.id })

    # Extract data from the result
    user_data = result["data"]["user"]

    # Perform assertions to verify data is correct
    assert_equal user.id.to_s, user_data["id"]
    assert_equal user.username, user_data["username"]
    assert_equal user.email, user_data["email"]
  end
end
