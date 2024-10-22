class MyPostsController < ApplicationController
  def index
    @posts = current_user.posts # ログイン中のユーザーの投稿を取得
  end
end