class PlanDiagnosesController < ApplicationController
  def index
  end

  def new
    @plan_diagnosis = PlanDiagnosis.new
  end

  def create
    # フォームデータを受け取る（nil の場合に対処）
    # plan_diagnosis_params = params[:plan_diagnosis] || {} 
    # question1 = plan_diagnosis_params[:question1]
    # question2 = plan_diagnosis_params[:question2]
    # question3 = plan_diagnosis_params[:question3]

    # 診断結果のロジック
    # if question1 == '1' && question2 == '1' && question3 == '1'
      # @diagnosis_result = "大手キャリアメインプラン（docomo,au,softbank）がおすすめです"
    # else
      # @diagnosis_result = "他のプランがおすすめです。詳細な診断結果をお待ちください。"
    # end

    # 診断結果をセッションに保存
    # session[:result] = result

    # result ビューにリダイレクト
    # redirect_to result_plan_diagnoses_path
  end

  def result
    # セッションから診断結果を取得
    @result = session[:result]
  end
end