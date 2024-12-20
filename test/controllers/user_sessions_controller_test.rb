require "test_helper"

class UserSessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)  # fixtureのoneを参照
  end

  test "should get new" do
    get login_path   # user_sessions_new_url から変更
    assert_response :success
  end

  test "should get create" do
    post login_path, params: {
      email: @user.email,
      password: "password"  # fixtureで設定したパスワード
    }
    assert_response :redirect
    assert_redirected_to posts_path
  end

  test "should get destroy" do
    # ログインしたあとに削除
    post login_path, params: { email: @user.email, password: "password" }
    delete logout_path
    assert_response :see_other
    assert_redirected_to root_path
  end
end
