class AddLineUserIdToUsersAndRemoveFromAuthentications < ActiveRecord::Migration[7.2]
  def change
    # authentications テーブルから line_user_id カラムを削除
    remove_column :authentications, :line_user_id, :string

    # users テーブルに line_user_id カラムを追加
    add_column :users, :line_user_id, :string

    # users テーブルの email カラムの null: false 制約を削除
    change_column_null :users, :email, true
  end
end
