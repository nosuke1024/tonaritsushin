require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should redirect to login when not logged in" do
    get items_path
    assert_redirected_to login_path
  end
end
