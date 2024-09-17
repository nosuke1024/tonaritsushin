class ChangePosts < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        # `posts`テーブルの`title`カラムを整数型に変更する
        # `using: 'title::integer'` は、文字列型の `title` を整数型に変換するための PostgreSQL 固有の構文
        # `default: 0` は、新しい整数型のカラムにデフォルト値 0 を設定する
        # `null: false` は、このカラムに NULL 値を許可しない
        change_column :posts, :title, :integer, using: 'title::integer', default: 0, null: false 
      end

      dir.down do
        # `posts`テーブルの`title`カラムを文字列型に戻す
        change_column :posts, :title, :string
      end
    end
  end
end