class CreateNotifications < ActiveRecord::Migration[7.2]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: true, type: :integer
      t.integer :visitor_id
      t.integer :visited_id
      t.references :notifiable, polymorphic: true, type: :string
      # デフォルト値「空欄時」では通知を受け取らない
      t.string :action, default: ''
      t.boolean :checked, default: false

      t.timestamps
    end

    add_index :notifications, :visitor_id
    add_index :notifications, :visited_id

    # 外部キー制約を追加
    add_foreign_key :notifications, :users, column: :visitor_id
    add_foreign_key :notifications, :users, column: :visited_id
  end
end
