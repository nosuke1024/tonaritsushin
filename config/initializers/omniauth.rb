Rails.application.config.middleware.use OmniAuth::Builder do
  # LINEのプロバイダーとスコープの指定
  provider :line, ENV['LINE_OmniAuth_ID'], ENV['LINE_OmniAuth_SECRET'],
           scope: 'profile openid',
           # コールバックURLを追加
           callback_url: 'https://8703-14-9-144-128.ngrok-free.app/auth/line/callback?provider=line' # 認証後にリダイレクトされるURL
end