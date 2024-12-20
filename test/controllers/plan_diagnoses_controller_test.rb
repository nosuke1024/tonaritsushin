require "test_helper"

class PlanDiagnosesControllerTest < ActionDispatch::IntegrationTest
  test "should post create" do
    post plan_diagnoses_path, params: {
      question1: "value1",
      question2: "value2",
      question3: "value3"
    }
    assert_redirected_to result_plan_diagnoses_path
  end
end
