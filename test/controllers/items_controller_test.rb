require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    login_as(@user)
  end

  test "should get index for logged in user" do
    get items_path
    assert_response :success
  end

  test "should redirect to login when not logged in" do
    logout
    get items_path
    assert_redirected_to login_path
  end

  private

  def login_as(user)
    post login_url, params: { email: user.email, password: "password" }
  end

  def logout
    delete logout_url
  end
end