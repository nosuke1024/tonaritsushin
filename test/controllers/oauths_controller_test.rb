require "test_helper"

class OauthsControllerTest < ActionDispatch::IntegrationTest
  test "should redirect to login path" do
    get oauth_path
    assert_response :redirect
  end
end