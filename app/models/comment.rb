class Comment < ApplicationRecord
  validates :body, presence: true, length: { maximum: 65_535 }

  belongs_to :user
  belongs_to :post

  # ポリモーフィック関連付け
  has_many :notifications, as: :notifiable, dependent: :destroy
end
