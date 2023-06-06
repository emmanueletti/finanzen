require "test_helper"

class SessionsControllerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "#new returns the html login form" do
    SessionsController.new
  end

  test "#create creates a new session after a successful auth" do
  end

  test "#create routes to the dashboard after a successful auth " do
  end

  test "#create resets the session after a successful auth to prevent session re-use attack" do
  end

  test "#destroy destroys the session and routes to the login page" do
  end
end
