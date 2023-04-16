require "test_helper"

class WealthControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wealth_index_url
    assert_response :success
  end
end
