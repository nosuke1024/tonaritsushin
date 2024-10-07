class FavoritesController < ApplicationController
  def index; end

  def create
    @post = Post.find(params[:post_id])
    current_user.favorite(@post)

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("favorite_#{@post.id}", partial: 'posts/favorite', locals: { post: @post })
      end
    end
  end

  def destroy
    @post = current_user.post.find(params[:id]).post
    current_user.favorite(@post)
  end
end