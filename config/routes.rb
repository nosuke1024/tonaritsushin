Rails.application.routes.draw do
  get "notifications/index"
  get "oauths/oauth"
  get "oauths/callback"
  get "items/index"
  # 初期ページのルーティング
  root "static_pages#top"
  resources :users, only: %i[new create]
  # 投稿機能に関する機能
  resources :posts, only: %i[index new create show edit update destroy] do
    resources :favorites, only: %i[index create destroy]
    resources :comments, only: %i[create edit destroy], shallow: true
    collection do
      get "search"
      get "search_candidates"
    end
  end

  # 通知機能
  resources :notifications, only: [ :index ] do
    collection do
      patch :update
    end
  end

  # プランの診断機能に関するルート
  resources :plan_diagnoses, only: %i[index create] do
    collection do
      get "result"
    end
  end

  # 購入方法の診断機能に関するルート
  resources :buy_diagnoses do
    collection do
      get "question1"
      get "question2"
      get "question3"
      get "question4"
      get "question5"
      get "question6"
    end
  end

  # ヘッターのリンク
  get "terms", to: "static_pages#terms"
  get "privacy", to: "static_pages#privacy"

  # マイページ用の情報取得
  resource :my_profile, only: [ :edit, :show, :update ]
  resources :my_posts, only: [ :index ]
  resources :my_favorites, only: [ :index ]

  # ログインユーザーの内容
  get "login", to: "user_sessions#new"
  post "login", to: "user_sessions#create"
  delete "logout", to: "user_sessions#destroy"

  # 料金プランの詳細ページ
  get "major_carrier", to: "plans#major_carrier"
  get "online_plan", to: "plans#online_plan"
  get "sub_brand", to: "plans#sub_brand"
  get "mvno", to: "plans#mvno"
  get "rakuten", to: "plans#rakuten"

  # 購入方法の診断結果
  get "carrier_shop", to: "buys#carrier_shop"
  get "electronics_retailer", to: "buys#electronics_retailer"
  get "carrier_online_shop", to: "buys#carrier_online_shop"
  get "manufacturer_direct_sale", to: "buys#manufacturer_direct_sale"
  get "major_ec_site", to: "buys#major_ec_site"
  get "used_store", to: "buys#used_store"
  get "used_online_sale", to: "buys#used_online_sale"
  get "flea_market_site", to: "buys#flea_market_site"

  # 楽天の検索
  get "items", to: "items#index"
  get "items/search", to: "items#search"

  # LINEを使った新規登録のoauthコントローラーのリクエスト
  get "oauth/callback" => "oauths#callback" # GETリクエストを追加
  post "oauth/callback" => "oauths#callback"
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider
  # 既存ユーザーのLINE連携用のLineConnectionsController用のルートを追加
  get "/auth/line/callback", to: "line_connections#callback" # LINE連携ページへのルート
  post "/auth/line/callback", to: "line_connections#callback" # LINE連携処理を行うルート
  delete "line_connection", to: "line_connections#destroy"

  # 初期設定のセットアップ時のルーティング
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
