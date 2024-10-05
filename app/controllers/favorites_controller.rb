class FavoritesController < ApplicationController
  def create
    @post = post.find(params[:post_id])
    current_user.favorite(@post)
  end

  def destroy
    @post = current_user.post.find(params[:id]).post
    current_user.favorite(@post)
  end
end