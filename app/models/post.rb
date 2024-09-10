class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65_535 }

  belongs_to :user

  # ENUMの定義
  enum previous_carrier: { 大手キャリア: 0, 大手キャリアオンラインプラン: 1, 大手キャリアサブブランド: 2, 楽天モバイルまたは格安SIM: 3 }, _prefix: :previous_carrier
  enum new_carrier: { 大手キャリア: 0, 大手キャリアオンラインプラン: 1, 大手キャリアサブブランド: 2, 楽天モバイルまたは格安SIM: 3 }, _prefix: :new_carrier
  enum price_difference: { '1001円以上ダウン': 0, '1001円以上アップ': 1, '1000円ダウン～1000円アップ': 2 }
  enum device_payment: { 'あり': 0, 'なし': 1 }
  enum purchase_method: { 乗り換え: 0, オンラインショップ: 1, 店頭による機種変更: 2 }
end
