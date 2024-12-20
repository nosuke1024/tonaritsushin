require "test_helper"

class UserSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_path   # user_sessions_new_url から変更
    assert_response :success
  end

  test "should get create" do
    post login_path, params: { email: 'test@example.com', password: 'password' }   # HTTPメソッドとパスを変更
    assert_response :redirect
    assert_redirected_to posts_path
  end

  test "should get destroy" do
    delete logout_path    # user_sessions_destroy_url から変更
    assert_response :see_other
    assert_redirected_to root_path
  end
end