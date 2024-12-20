require "test_helper"

class OauthsControllerTest < ActionDispatch::IntegrationTest
  test "should get oauth" do
    get oauth_path(provider: 'line')  # providerパラメータを追加
    assert_response :success
  end

  test "should get callback" do
    get oauth_callback_path(provider: 'line')  # providerパラメータを追加
    # コールバックは通常リダイレクトするので
    assert_response :redirect
    # ログイン失敗時はroot_pathにリダイレクト
    assert_redirected_to root_path
  end
end