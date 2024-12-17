class Comment < ApplicationRecord
  validates :body, presence: true, length: { maximum: 65_535 }

  belongs_to :user
  belongs_to :post

  # ポリモーフィック関連付け
  has_many :notifications, as: :notifiable, dependent: :destroy
  # コールバックの設定とその後生成するメソッドについて
  after_create_commit :create_notification_comment!

  private

  def create_notification_comment!
    notification = notifications.new(
      user_id: post.user.id,      # 通知の受信者(投稿の作者)のID
      visitor_id: user.id,        # コメントしたユーザーのID
      visited_id: post.user.id,  # 投稿の作者のID
      action: "comment",          # 通知の種類
      notifiable_type: "Comment", # 通知対象のモデルのクラス名
      notifiable_id: id           # 通知対象のモデルのID
    )
    notification.save!
  end
end
