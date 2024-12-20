class PlanDiagnosis
  include ActiveModel::Model
  include ActiveModel::Attributes

  def self.diagnose(params)
    # 1-1
    if params[:question1] == "1" && params[:question2] == "1" && params[:question3] == "1"
      "大手キャリアメインプラン（docomo,au,softbank）がおすすめです"
    elsif params[:question1] == "1" && params[:question2] == "1" && params[:question3] == "2"
      "大手キャリアメインプラン（docomo,au,softbank）がおすすめです"
    elsif params[:question1] == "1" && params[:question2] == "1" && params[:question3] == "3"
      "大手キャリアメインプラン（docomo,au,softbank）（大手オンライン料金プラン）がおすすめです"
    elsif params[:question1] == "1" && params[:question2] == "1" && params[:question3] == "4"
      "（大手キャリアオンラインプラン（ahamo,povo,linmo））がおすすめです"
    elsif params[:question1] == "1" && params[:question2] == "1" && params[:question3] == "5"
      "（大手キャリアオンラインプラン（ahamo,povo,linmo））がおすすめです"
    # 1-2
    elsif params[:question1] == "1" && params[:question2] == "2" && params[:question3] == "1"
      "大手キャリアメインプラン（docomo,au,softbank）、（大手キャリアサブブランド）、（楽天モバイル）がおすすめです"
    elsif params[:question1] == "1" && params[:question2] == "2" && params[:question3] == "2"
      "大手キャリアサブブランド（irumo,UQﾓﾊﾞｲﾙ,Yﾓﾊﾞｲﾙ）がおすすめです"
    elsif params[:question1] == "1" && params[:question2] == "2" && params[:question3] == "3"
      "大手キャリアサブブランド（irumo,UQﾓﾊﾞｲﾙ,Yﾓﾊﾞｲﾙ）がおすすめです"
    elsif params[:question1] == "1" && params[:question2] == "2" && params[:question3] == "4"
      "大手キャリアサブブランド（irumo,UQﾓﾊﾞｲﾙ,Yﾓﾊﾞｲﾙ）がおすすめです"
    elsif params[:question1] == "1" && params[:question2] == "2" && params[:question3] == "5"
      "（サブブランド）（格安SIM）がおすすめです"
    # 1-3
    elsif params[:question1] == "1" && params[:question2] == "3" && params[:question3] == "1"
      "楽天モバイルがおすすめです"
    elsif params[:question1] == "1" && params[:question2] == "3" && params[:question3] == "2"
      "格安SIM, 楽天モバイルがおすすめです"
    elsif params[:question1] == "1" && params[:question2] == "3" && params[:question3] == "3"
      "格安SIM, 楽天モバイルがおすすめです"
    elsif params[:question1] == "1" && params[:question2] == "3" && params[:question3] == "4"
      "格安SIMがおすすめです"
    elsif params[:question1] == "1" && params[:question2] == "3" && params[:question3] == "5"
      "格安SIMがおすすめです"
    # 2-1
    elsif params[:question1] == "2" && params[:question2] == "1" && params[:question3] == "1"
      "大手キャリアメインプラン（docomo,au,softbank）がおすすめです"
    elsif params[:question1] == "2" && params[:question2] == "1" && params[:question3] == "2"
      "大手キャリアメインプラン（docomo,au,softbank）がおすすめです"
    elsif params[:question1] == "2" && params[:question2] == "1" && params[:question3] == "3"
      "大手キャリアメインプラン（docomo,au,softbank）がおすすめです"
    elsif params[:question1] == "2" && params[:question2] == "1" && params[:question3] == "4"
      "（大手キャリアオンラインプラン（ahamo,povo,linmo））がおすすめです"
    elsif params[:question1] == "2" && params[:question2] == "1" && params[:question3] == "5"
      "（大手キャリアオンラインプラン（ahamo,povo,linmo））がおすすめです"
    # 2-2
    elsif params[:question1] == "2" && params[:question2] == "2" && params[:question3] == "1"
      "大手キャリアサブブランド（irumo,UQﾓﾊﾞｲﾙ,Yﾓﾊﾞｲﾙ）、（大手キャリアメインプラン）（楽天モバイル）がおすすめです"
    elsif params[:question1] == "2" && params[:question2] == "2" && params[:question3] == "2"
      "大手キャリアサブブランド（irumo,UQﾓﾊﾞｲﾙ,Yﾓﾊﾞｲﾙ）がおすすめです"
    elsif params[:question1] == "2" && params[:question2] == "2" && params[:question3] == "3"
      "大手キャリアサブブランド（irumo,UQﾓﾊﾞｲﾙ,Yﾓﾊﾞｲﾙ）がおすすめです"
    elsif params[:question1] == "2" && params[:question2] == "2" && params[:question3] == "4"
      "大手キャリアサブブランド（irumo,UQﾓﾊﾞｲﾙ,Yﾓﾊﾞｲﾙ）がおすすめです"
    elsif params[:question1] == "2" && params[:question2] == "2" && params[:question3] == "5"
      "大手キャリアサブブランド（irumo,UQﾓﾊﾞｲﾙ,Yﾓﾊﾞｲﾙ）がおすすめです"
    # 2-3
    elsif params[:question1] == "2" && params[:question2] == "3" && params[:question3] == "1"
      "楽天モバイルがおすすめです"
    elsif params[:question1] == "2" && params[:question2] == "3" && params[:question3] == "2"
      "格安SIM, 楽天モバイルがおすすめです"
    elsif params[:question1] == "2" && params[:question2] == "3" && params[:question3] == "3"
      "格安SIM, 楽天モバイルがおすすめです"
    elsif params[:question1] == "2" && params[:question2] == "3" && params[:question3] == "4"
      "格安SIMがおすすめです"
    elsif params[:question1] == "2" && params[:question2] == "3" && params[:question3] == "5"
      "格安SIMがおすすめです"
    # 3-1
    elsif params[:question1] == "3" && params[:question2] == "1" && params[:question3] == "1"
      "大手キャリアオンラインプラン（ahamo,povo,linmo）がおすすめです"
    elsif params[:question1] == "3" && params[:question2] == "1" && params[:question3] == "2"
      "大手キャリアオンラインプラン（ahamo,povo,linmo）がおすすめです"
    elsif params[:question1] == "3" && params[:question2] == "1" && params[:question3] == "3"
      "大手キャリアオンラインプラン（ahamo,povo,linmo）がおすすめです"
    elsif params[:question1] == "3" && params[:question2] == "1" && params[:question3] == "4"
      "大手キャリアオンラインプラン（ahamo,povo,linmo）がおすすめです"
    elsif params[:question1] == "3" && params[:question2] == "1" && params[:question3] == "5"
      "大手キャリアオンラインプラン（ahamo,povo,linmo）がおすすめです"
    # 3-2
    elsif params[:question1] == "3" && params[:question2] == "2" && params[:question3] == "1"
      "大手キャリアオンラインプラン（ahamo,povo,linmo）がおすすめです"
    elsif params[:question1] == "3" && params[:question2] == "2" && params[:question3] == "2"
      "大手キャリアオンラインプラン（ahamo,povo,linmo）, 大手キャリアサブブランド（irumo,UQﾓﾊﾞｲﾙ,Yﾓﾊﾞｲﾙ）がおすすめです"
    elsif params[:question1] == "3" && params[:question2] == "2" && params[:question3] == "3"
      "大手キャリアオンラインプラン（ahamo,povo,linmo）, 大手キャリアサブブランド（irumo,UQﾓﾊﾞｲﾙ,Yﾓﾊﾞｲﾙ）がおすすめです"
    elsif params[:question1] == "3" && params[:question2] == "2" && params[:question3] == "4"
      "大手キャリアオンラインプラン（ahamo,povo,linmo）, 大手キャリアサブブランド（irumo,UQﾓﾊﾞｲﾙ,Yﾓﾊﾞｲﾙ）がおすすめです"
    elsif params[:question1] == "3" && params[:question2] == "2" && params[:question3] == "5"
      "大手キャリアオンラインプラン（ahamo,povo,linmo）がおすすめです"
    # 3-3
    elsif params[:question1] == "3" && params[:question2] == "3" && params[:question3] == "1"
      "楽天モバイルがおすすめです"
    elsif params[:question1] == "3" && params[:question2] == "3" && params[:question3] == "2"
      "楽天モバイル、格安SIMがおすすめです"
    elsif params[:question1] == "3" && params[:question2] == "3" && params[:question3] == "3"
      "楽天モバイル, 格安SIMがおすすめです"
    elsif params[:question1] == "3" && params[:question2] == "3" && params[:question3] == "4"
      "格安SIMがおすすめです"
    elsif params[:question1] == "3" && params[:question2] == "3" && params[:question3] == "5"
      "格安SIMがおすすめです"
    # 4-1
    elsif params[:question1] == "4" && params[:question2] == "1" && params[:question3] == "1"
      "大手キャリアオンラインプラン（ahamo,povo,linmo）がおすすめです"
    elsif params[:question1] == "4" && params[:question2] == "1" && params[:question3] == "2"
      "大手キャリアオンラインプラン（ahamo,povo,linmo）がおすすめです"
    elsif params[:question1] == "4" && params[:question2] == "1" && params[:question3] == "3"
      "大手キャリアオンラインプラン（ahamo,povo,linmo）がおすすめです"
    elsif params[:question1] == "4" && params[:question2] == "1" && params[:question3] == "4"
      "大手キャリアオンラインプラン（ahamo,povo,linmo）がおすすめです"
    elsif params[:question1] == "4" && params[:question2] == "1" && params[:question3] == "5"
      "大手キャリアオンラインプラン（ahamo,povo,linmo）がおすすめです"
    # 4-2
    elsif params[:question1] == "4" && params[:question2] == "2" && params[:question3] == "1"
      "大手キャリアオンラインプラン（ahamo,povo,linmo）、楽天モバイルがおすすめです"
    elsif params[:question1] == "4" && params[:question2] == "2" && params[:question3] == "2"
      "大手キャリアオンラインプラン（ahamo,povo,linmo）がおすすめです"
    elsif params[:question1] == "4" && params[:question2] == "2" && params[:question3] == "3"
      "大手キャリアオンラインプラン（ahamo,povo,linmo）がおすすめです"
    elsif params[:question1] == "4" && params[:question2] == "2" && params[:question3] == "4"
      "オ大手キャリアオンラインプラン（ahamo,povo,linmo）がおすすめです"
    elsif params[:question1] == "4" && params[:question2] == "2" && params[:question3] == "5"
      "大手キャリアオンラインプラン（ahamo,povo,linmo）がおすすめです"
    # 4-3
    elsif params[:question1] == "4" && params[:question2] == "3" && params[:question3] == "1"
      "楽天モバイルがおすすめです"
    elsif params[:question1] == "4" && params[:question2] == "3" && params[:question3] == "2"
      "大手キャリアオンラインプラン（ahamo,povo,linmo）、楽天モバイル、格安SIMがおすすめです"
    elsif params[:question1] == "4" && params[:question2] == "3" && params[:question3] == "3"
      "大手キャリアオンラインプラン（ahamo,povo,linmo）、楽天モバイル、格安SIMがおすすめです"
    elsif params[:question1] == "4" && params[:question2] == "3" && params[:question3] == "4"
      "大手キャリアオンラインプラン（ahamo,povo,linmo）、格安SIMがおすすめです"
    elsif params[:question1] == "4" && params[:question2] == "3" && params[:question3] == "5"
      "格安SIMがおすすめです"
    else
      "他のプランがおすすめです。詳細な診断結果をお待ちください。"
    end
  end
end
