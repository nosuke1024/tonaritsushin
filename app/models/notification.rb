class Notification < ApplicationRecord
  belongs_to :user
  # 通知の訪問者（アクションを起こしたユーザー）
  belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id'
  # 通知の受信者（アクションの対象となったユーザー）
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id'

  # ポリモーフィック関連付け
  belongs_to :notifiable, polymorphic: true
end

