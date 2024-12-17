require "line/bot" # line-bot-apiとセット

class NotificationsController < ApplicationController
  before_action :set_notifications, only: [ :index ]

  def index
    # 通常の通知に関する内容
    @notifications = current_user.passive_notifications.order(created_at: :desc).page(params[:page]).per(20)
    @notifications.where(checked: false).update_all(checked: true)
  end

  # LINW通知の更新
  def update
    # まずLINEのユーザーIDが存在するか確認
    unless current_user.line_user_id.present?
      set_notifications
      flash[:danger] = "LINE連携が必要です。先にLINE連携を行ってください。"
      return render :index
    end

    # LINE連携済みの場合、通知設定を更新
    if current_user.update_column(:line_notification_enabled, params[:user][:line_notification_enabled])
      redirect_to notifications_path, success: t("defaults.flash_message.notification_success")
    else
      # 通知設定の更新に失敗した場合
      set_notifications
      render :index, danger: t("defaults.flash_message.notification_failure")
    end
  end

  private

  # 通知内容をインスタンス変数として格納
  def set_notifications
    @notifications = current_user.passive_notifications.order(created_at: :desc).page(params[:page]).per(20)
  end

  # 通知の更新
  def user_params
    params.require(:user).permit(:line_notification_enabled)
  end
end
