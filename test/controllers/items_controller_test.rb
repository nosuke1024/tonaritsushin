require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    # テスト前にログイン
    post login_path, params: { email: @user.email, password: 'password' }
  end

  test "should get index" do
    get items_index_url
    assert_response :success
  end
end
