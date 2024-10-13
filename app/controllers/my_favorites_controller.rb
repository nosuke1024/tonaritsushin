class MyFavoritesController < ApplicationController
  def index
    @favorites = current_user.favorites # ログイン中のユーザーのお気に入りを取得
  end
end
