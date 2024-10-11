class FavoritesController < ApplicationController
  before_action :require_login

  def create
    post = Post.find(params[:post_id])
    current_user.favorite(post)
    redirect_to posts_path(post)
  end

  def destroy
    favorite = current_user.favorites.find_by(post_id: params[:post_id])

    if favorite.present?
      favorite.destroy
      redirect_to params[:redirect_to] || post_path(favorite.post)
    else
      flash[:error] = 'お気に入りボタンを連打しないでください！'
      redirect_back(fallback_location: root_path)
    end
  end
end