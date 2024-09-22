class PlanDiagnosesController < ApplicationController
  def index
  end

  def create
	  # strong parameters を使用して安全にパラメータ（データ）を取得。内容については、privateメソッドの下。
    # plan_diagnosis = PlanDiagnosis.new(plan_diagnosis_params)

    # 診断結果のロジック (ここには診断ロジックを実装します)
    # if plan_diagnosis_params[:question1] == '1' && plan_diagnosis_params[:question2] == '1' && plan_diagnosis_params[:question3] == '1'
      # @diagnosis_result = "大手キャリアメインプラン（docomo,au,softbank）がおすすめです"
    # else
      # @diagnosis_result = "他のプランがおすすめです。詳細な診断結果をお待ちください。"
    # end

    # 診断結果をセッションに保存
    # session[:result] = @diagnosis_result

    # result ビューにリダイレクト
    # redirect_to result_plan_diagnoses_path
  end

  def result# セッションから診断結果を取得
    @result = session[:result]
  end

  private

  def plan_diagnosis_params
    params.require(:plan_diagnosis).permit(:question1, :question2, :question3)
  end
end