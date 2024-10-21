class BuyDiagnosesController < ApplicationController
  def question1
    # 質問1を表示
  end

  def question1_answer
    case params[:answer]
    when 'new'
      redirect_to question2_buy_diagnosis_path
    when 'old'
      redirect_to question3_buy_diagnosis_path
    end
  end

  def question2
    # 質問2を表示
  end

  def question2_answer
    session[:answers]['carrier_change'] = params[:answer]

    case params[:answer]
    when 'yes'
      redirect_to question6_buy_diagnosis_path
    when 'no'
      redirect_to question4_buy_diagnosis_path
    end
  end

  def question3
    # 質問3を表示
  end

  def question3_answer
    session[:answers]['purchase_method'] = params[:answer]

    # 質問3では回答によって候補を決定し、質問6へ遷移
    case params[:answer]
    when 'store'
      session[:candidates] = ['中古販売店']
    when 'online'
      session[:candidates] = ['中古のオンライン販売']
    when 'flea_market'
      session[:candidates] = ['フリマサイト']
    when 'new_old'
      # 新品の古い端末として扱い、質問4へ遷移
      redirect_to question4_buy_diagnosis_path and return 
    end

    redirect_to question6_buy_diagnosis_path
  end

  def question4
    # 質問4を表示
  end

  def question4_answer
    session[:answers]['purchase_priority'] = params[:answer]

    case params[:answer]
    when 'price'
      redirect_to question5_buy_diagnosis_path
    when 'consultation'
      redirect_to question6_buy_diagnosis_path
    end
  end

  def question5
    # 質問5を表示
  end

  def question5_answer
    session[:answers]['decided_model'] = params[:answer]

    # 質問5では回答によって候補を決定
    case params[:answer]
    when 'yes'
      session[:candidates] = ['メーカー直販サイト']
    when 'no'
      session[:candidates] = ['大手ECサイト']
    end

    redirect_to question6_buy_diagnosis_path
  end

  def question6
    # 質問6を表示
  end

  def question6_answer
    session[:answers]['support_type'] = params[:answer]

    # 質問6では回答によって候補を追加
    case params[:answer]
    when 'online'
      session[:candidates] << 'キャリアのオンラインショップ' if session[:answers]['carrier_change'] == 'yes'
    when 'plan_comparison'
      session[:candidates] << '家電量販店'
    when 'full_support'
      session[:candidates] << 'キャリアショップ'
    end

    redirect_to result_buy_diagnosis_path
  end

  def result
    @recommendation = BuyDiagnoses.generate_recommendation(session[:answers], session[:candidates]) # 候補を渡す
    session[:answers] = nil # セッションをリセット
    session[:candidates] = nil # セッションをリセット
  end
end
