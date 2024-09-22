class PlanDiagnosesController < ApplicationController
  def index
  end

  def create
	  # strong parameters を使用して安全にパラメータ（データ）を取得。内容については、privateメソッドの下。
    @diagnosis_result = PlanDiagnosis.diagnose(plan_diagnosis_params)

    # 診断結果をセッションに保存
    session[:result] = @diagnosis_result

    # result ビューにリダイレクト
    redirect_to result_plan_diagnoses_path
  end

  def result# セッションから診断結果を取得
    @result = session[:result]
  end

  private

  def plan_diagnosis_params
    params.permit(:plan_diagnosis).permit(:question1, :question2, :question3)
  end
end