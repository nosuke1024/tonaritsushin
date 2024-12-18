class Post < ApplicationRecord
  # タイトルの空欄のバリテーションに変更
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 65_535 }, allow_blank: true
  # 空のままの場合バリテーションエラーを返す内容の追加
  validates :previous_carrier, presence: true
  validates :new_carrier, presence: true
  validates :carrier_changed, presence: true # 追加
  validates :price_difference, presence: true

  belongs_to :user
  # Favoritenに関する関係性の追加
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post
  has_many :comments, dependent: :destroy

  # タイトルのENUMに変更
  enum title: { plan_change: 0, smartphone_change: 1, change: 2, other: 3 }
  # ENUMの定義
  enum previous_carrier: { major_carrier: 0, online_plan: 1, sub_brand: 2, mvno: 3, rakuten: 4 }, _prefix: :previous_carrier
  enum new_carrier: { major_carrier: 0, online_plan: 1, sub_brand: 2, mvno: 3, rakuten: 4 }, _prefix: :new_carrier
  enum carrier_changed: { no_change_carrier: 0, change_carrier: 1 } # 新しいカラムの追加
  enum price_difference: { cheaper: 0, more_expensive: 1, no_change: 2 }
  enum device_payment: { bundled_sale: 0, device_only: 1 }
  enum purchase_method: { carrier_shop: 0, electronics_store: 1, online_shop: 2, ec_store: 3, used_store: 4, online_marketplace: 5 }

  # ランサックに対応するためのもの
  def self.ransackable_attributes(auth_object = nil)
    [ "body", "carrier_changed", "created_at", "device_payment", "id", "new_carrier", "previous_carrier", "price_difference", "purchase_method", "title", "updated_at", "user_id" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "comments", "favorite_posts", "favorites", "user" ]
  end
end
