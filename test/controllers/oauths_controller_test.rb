require "test_helper"

class OauthsControllerTest < ActionDispatch::IntegrationTest
  setup do
    setup_oauth_mock
  end

  test "should get callback" do
    # providerパラメータを必ず含める
    get oauth_callback_path, params: {
      provider: 'line',
      code: 'dummy_auth_code',
      state: 'dummy_state'
    }
    assert_response :redirect
    assert_redirected_to root_path
  end
end