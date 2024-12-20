require "test_helper"

class OauthsControllerTest < ActionDispatch::IntegrationTest
  setup do
    # テスト用の環境変数を設定
    ENV['LINE_Sorcery_ID'] = 'test_client_id'
    ENV['LINE_Sorcery_SECRET'] = 'test_client_secret'
  end

  test "should get callback" do
    # 必要最小限のパラメータのみ送信
    get oauth_callback_path, params: {
      provider: 'line',
      code: 'dummy_auth_code'
    }
    assert_response :redirect # リダイレクトされることを確認
    assert_redirected_to root_path # リダイレクト先の確認
  end
end