class BuyDiagnosesController < ApplicationController
  skip_before_action :require_login, only: [ :question1, :question2, :question3,
                                          :question4, :question5, :question6 ] # ログインしなくても使える

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

  # def result セッションで保存しないから削除
end
