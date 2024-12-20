require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    # テスト前にログイン
    post login_path, params: { email: @user.email, password: "password" }
  end

  test "should get index for logged in user" do
    get items_path
    assert_response :success
  end

  test "should redirect to login when not logged in" do
    delete logout_path  # ログアウトする
    get items_path
    assert_redirected_to login_path  # ログインページにリダイレクトされることを確認
  end
end
