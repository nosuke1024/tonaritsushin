require "test_helper"

class PlanDiagnosesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get plan_diagnoses_new_url
    assert_response :success
  end

  test "should get create" do
    get plan_diagnoses_create_url
    assert_response :success
  end
end
