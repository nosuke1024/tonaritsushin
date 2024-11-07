module NotificationsHelper
  # 未読の通知があるかどうか
  def unread_notification?(user)
    user.notifications.where(checked: false).exists?
  end
end
