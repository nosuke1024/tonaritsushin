class OauthsController < ApplicationController
  skip_before_action :require_login

  def oauth
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]
    if @user = login_from(provider)
      redirect_to root_path, :notice => "Logged in from #{provider.titleize}!"
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
