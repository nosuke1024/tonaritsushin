class PlanDiagnosesController < ApplicationController
  def index; end

  def create
    # strong parameters を使用して安全にパラメータを取得
    safe_params = plan_diagnosis_params

    # 診断結果を取得し、セッションに保存
    diagnosis_result = PlanDiagnosis.diagnose(safe_params)
    session[:diagnosis_result] = diagnosis_result

    # result ビューにリダイレクト
    redirect_to result_plan_diagnoses_path
  end

  def result
    # セッションから診断結果を取得
    @diagnosis_result = session[:diagnosis_result]
  end

  private

  def plan_diagnosis_params
    params.permit(:question1, :question2, :question3)
  end
end