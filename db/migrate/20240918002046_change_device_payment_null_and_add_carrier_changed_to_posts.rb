class ChangeDevicePaymentNullAndAddCarrierChangedToPosts < ActiveRecord::Migration[7.2]
  def change
    # device_paymentカラムのnull制約を解除
    change_column_null :posts, :device_payment, true

    # carrier_changedカラムを追加 (ENUM型)
    add_column :posts, :carrier_changed, :integer, default: 0
  end
end
