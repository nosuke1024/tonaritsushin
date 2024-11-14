class AddLineUserIdToAuthentications < ActiveRecord::Migration[7.2]
  def change
    add_column :authentications, :line_user_id, :string
  end
end
