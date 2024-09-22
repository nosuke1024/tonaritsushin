class PlanDiagnosis < ApplicationRecord

  def self.diagnose(params)
    if params[:question1] == '1' && params[:question2] == '1' && params[:question3] == '1'
      "大手キャリアメインプラン（docomo,au,softbank）がおすすめです"
    else
      "他のプランがおすすめです。詳細な診断結果をお待ちください。"
    end
  end
end
