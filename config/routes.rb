Rails.application.routes.draw do
  # 初期ページのルーティング
  root 'static_pages#top'
  resources :users, only: %i[new create show]
  # 投稿機能に関する機能
  resources :posts, only: %i[index new create show edit update destroy]
  # 診断機能に関するルート
  resources :plan_diagnoses, only: %i[index create] do
    collection do
      get 'result'
    end
  end

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

  # 初期設定のセットアップ時のルーティング
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
