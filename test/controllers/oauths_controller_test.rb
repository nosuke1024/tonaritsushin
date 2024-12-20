require "test_helper"

class OauthsControllerTest < ActionDispatch::IntegrationTest
  test "should redirect to login path" do
    get auth_at_provider_path(provider: 'line')
    assert_response :redirect
  end
end
