class OauthsController < ApplicationController
  skip_before_action :require_login

  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]
    # 既にログインしたことあるユーザーの場合。
    if @user = login_from(provider)
      redirect_to posts_path, flash: { success: t('user_sessions.create.success') } # 変更
    else
      # 新規ユーザーがLINE認証を使ったユーザー登録
      begin
        @user = create_from(provider)
        reset_session
        auto_login(@user)
        redirect_to root_path, success: t('user_sessions.create.success')
      rescue
        flash.now[:danger] = t('users.create.failure')
        redirect_to root_path
      end
    end
  end

  private

  def auth_params
    params.permit(:code, :provider, :error, :state)
  end

end
