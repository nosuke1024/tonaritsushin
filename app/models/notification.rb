class Notification < ApplicationRecord
  belongs_to :user
  # 通知の訪問者（アクションを起こしたユーザー）
  belongs_to :visitor, class_name: "User", foreign_key: "visitor_id"
  # 通知の受信者（アクションの対象となったユーザー）
  belongs_to :visited, class_name: "User", foreign_key: "visited_id"
  # ポリモーフィック関連付け
  belongs_to :notifiable, polymorphic: true

  # コールバックの定義
  after_create :send_line_notification

  private

  # LINEのメッセージについての記載
  def send_line_notification
    # 通知を受けた人がLINE通知の有効かどうか
    return unless visited.line_notification_enabled?
    # 通知が未読か
    return unless checked == false

    # LINE通知を送信するためのユーザーIDで、ユーザーテーブル取得
    line_id = visited.line_user_id
    return unless line_id

    # LINE通知送信
    client = Line::Bot::Client.new { |config|
      config.channel_secret = ENV["MESSAGING_CHANNEL_SECRET"]
      config.channel_token = ENV["MESSAGING_CHANNEL_TOKEN"]
    }

    message = {
      type: "flex",
      altText: "新しい通知があります",
      contents: {
        type: "bubble",
        body: {
          type: "box",
          layout: "vertical",
          contents: [
            {
              type: "text",
              text: "新しい通知が届きました",
              weight: "bold",
              size: "xl"
            },
            {
              type: "button",
              style: "primary",
              action: {
                type: "uri",
                label: "通知を確認する",
                uri: "https://smart-phone-choice.com/notifications"
              }
            }
          ]
        }
      }
    }

    begin
      response = client.push_message(line_id, message)
      Rails.logger.info "LINE notification sent: #{response}"
    rescue => e
      Rails.logger.error "LINE notification failed: #{e.message}"
    end
  end
end
