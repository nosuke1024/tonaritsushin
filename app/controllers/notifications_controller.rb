require 'line/bot' # line-bot-apiとセット

class NotificationsController < ApplicationController
  def index
    # 通常の通知に関する内容
    @notifications = current_user.passive_notifications.order(created_at: :desc).page(params[:page]).per(20)
    @notifications.where(checked: false).update_all(checked: true)
  end

  # 通知の更新
  def update
    if current_user.update(user_params)
      if params[:user][:line_notification_enabled] == "true"
        # LINE通知をONにする場合、友達追加画面へリダイレクト
        redirect_to "https://lin.ee/VgbvT1p", allow_other_host: true  # 短縮URLを使用
      else
        redirect_to notifications_path, success: t('defaults.flash_message.notification_success')
      end
    else
      render :index, danger: t('defaults.flash_message.notification_failure')
    end
  end

  private

  # 通知の更新
  def user_params
    params.require(:user).permit(:line_notification_enabled)
  end

end
