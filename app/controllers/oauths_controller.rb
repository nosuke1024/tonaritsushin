require 'line/bot' # line-bot-apiとセット

class OauthsController < ApplicationController
  skip_before_action :require_login

  def oauth
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]

    if logged_in?
      # sorceryを使って登録済みの既存ユーザーのLINE連携処理
      if provider == 'line'
        # link_line_account
      end
      redirect_to root_path, success: t('user_sessions.create.success')

    else
      # 新規ユーザーがLINE認証を使ったユーザー登録
      begin
        @user = create_from(provider)
        reset_session
        auto_login(@user)
        redirect_to root_path, success: t('user_sessions.create.success')
      rescue
        redirect_to root_path, flash: { danger: t('user_sessions.destroy.success') }
      end
    end
  end

  private

  # def auth_params
  #   params.permit(:code, :provider)
  # end

end
