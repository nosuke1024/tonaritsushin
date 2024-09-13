class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65_535 }

  belongs_to :user

  # ENUMの定義
  enum previous_carrier: { major_carrier: 0, online_plan: 1, sub_brand: 2, mvno: 3 }, _prefix: :previous_carrier
  enum new_carrier: { major_carrier: 0, online_plan: 1, sub_brand: 2, mvno: 3 }, _prefix: :new_carrier
  enum price_difference: { cheaper: 0, more_expensive: 1, no_change: 2 }
  enum device_payment: { yes: 0, no: 1 }
  enum purchase_method: { carrier_switch: 0, online_shop: 1, shop: 2 }

  # ユーザーの区別はまだ
  # def own?(object) object.user_id == self.id end

end
