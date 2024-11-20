class AddIndexToPostsBody < ActiveRecord::Migration[7.2]
  def change
    add_index :posts, :body
  end
end
