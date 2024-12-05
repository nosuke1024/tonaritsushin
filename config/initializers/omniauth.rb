Rails.application.config.middleware.use OmniAuth::Builder do
  # LINEのプロバイダーとスコープの指定
  provider :line, ENV['LINE_OmniAuth_ID'], ENV['LINE_OmniAuth_SECRET'],
            scope: 'profile openid email',
            bot_prompt: 'aggressive',
            # 本番環境のコールバックURLに変更する
            callback_url: 'https://smart-phone-choice.com/auth/line/callback?provider=line' # 認証後にリダイレクトされるURL
end