require "test_helper"

class OauthsControllerTest < ActionDispatch::IntegrationTest
  test "should get oauth" do
    # :auth_at_provider パスを使用
    get auth_at_provider_path(provider: 'line')
    assert_response :success
  end

  test "should get callback" do
    # 直接パスを指定
    get oauth_callback_path
    assert_response :redirect
    assert_redirected_to root_path
  end
end