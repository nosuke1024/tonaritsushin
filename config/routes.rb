Rails.application.routes.draw do
  # 初期ページのルーティング
  root 'static_pages#top'
  resources :users, only: %i[new create]

  # ログインユーザーの内容
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  # 初期設定のセットアップ時のルーティング
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
