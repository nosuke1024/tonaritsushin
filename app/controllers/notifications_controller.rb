require 'line/bot' # line-bot-apiとセット

class NotificationsController < ApplicationController
  def index
    # 通常の通知に関する内容
    @notifications = current_user.passive_notifications.order(created_at: :desc).page(params[:page]).per(20)
    @notifications.where(checked: false).update_all(checked: true)
    # LINE通知に関する内容
    @notifications.each do |notification|
      if notification.user.line_notification_enabled?
        line_id = notification.user.authentications.find_by(provider: 'line')&.uid

        if line_id
          message = "新しい通知があります: #{notification.message}"
          send_line_notification(line_id, message) # LINE通知を送信するメソッドを呼び出す
        end
      end
    end
  end

  # 通知の更新
  def update
    if current_user.update(user_params)
      redirect_to notifications_path, notice: '通知設定を更新しました'
    else
      render :index, alert: '通知設定の更新に失敗しました'
    end
  end

  private

  # 通知の更新
  def user_params
    params.require(:user).permit(:line_notification_enabled)
  end

  # LINE通知に関するメソッド
  def send_line_notification(line_id, message)
    client = Line::Bot::Client.new { |config|
      config.channel_secret =ENV['MESSAGING_CHANNEL_SECRET']
      config.channel_token =ENV['MESSAGING_CHANNEL_TOKEN']
    }

    message = {
      type: 'text',
      text: message
    }

    response = client.push_message(line_id, message)
    p response
  end
end
