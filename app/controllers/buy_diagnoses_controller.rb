class BuyDiagnosesController < ApplicationController
  def question1
    # 質問1を表示
  end

  # def question1_answer 直接書く方法にしたため不要

  def question2
    # 質問2を表示
  end

  def question3
    # 質問3を表示
  end

  def question4
    # 質問4を表示
  end

  def question5
    # 質問5を表示
  end

  def question6
    # 質問6を表示
  end

  def result
    @recommendation = BuyDiagnoses.generate_recommendation(session[:answers], session[:candidates]) # 候補を渡す
    session[:answers] = nil # セッションをリセット
    session[:candidates] = nil # セッションをリセット
  end
end
