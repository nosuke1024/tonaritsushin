class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.references :user, foreign_key: true

      # ENUM型のカラムを追加
      t.integer :previous_carrier, default: 0, null: false
      t.integer :new_carrier, default: 0, null: false
      t.integer :price_difference, default: 2
      t.integer :device_payment, default: 0, null: false
      t.integer :purchase_method, default: 0
      t.timestamps
    end
  end
end