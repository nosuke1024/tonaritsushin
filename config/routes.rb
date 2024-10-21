Rails.application.routes.draw do
  # 初期ページのルーティング
  root 'static_pages#top'
  resources :users, only: %i[new create show]
  # 投稿機能に関する機能
  resources :posts, only: %i[index new create show edit update destroy] do
    # ここにはコメント機能のルートを追加する予定
    resources :favorites, only: %i[index create destroy]  # お気に入り機能の追加
    resources :comments, only: %i[create edit destroy], shallow: true #コメント機能の追加
  end

  # プランの診断機能に関するルート
  resources :plan_diagnoses, only: %i[index create] do
    collection do
      get 'result'
    end
  end

  # 購入方法の診断機能に関するルート
  resources :buy_diagnoses do
    collection do
      get 'question1'
      post 'question1_answer'
      get 'question2'
      post 'question2_answer'
      get 'question3'
      post 'question3_answer'
      get 'question4'
      post 'question4_answer'
      get 'question5'
      post 'question5_answer'
      get 'question6'
      post 'question6_answer'
      get 'result' # 診断結果表示用
    end
  end
  # マイページ用の情報取得
  resource :my_profile, only: [:edit, :show, :update]
  resources :my_posts, only: [:index]
  resources :my_favorites, only: [:index]

  # ログインユーザーの内容
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  # 料金プランの詳細ページ
  get 'major_carrier', to: 'plans#major_carrier'
  get 'online_plan', to: 'plans#online_plan'
  get 'sub_brand', to: 'plans#sub_brand'
  get 'mvno', to: 'plans#mvno'
  get 'rakuten', to: 'plans#rakuten'

  # 診断結果のページ

  # 初期設定のセットアップ時のルーティング
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
