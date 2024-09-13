class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, success: t('defaults.flash_message.created',)
    else
      flash.now[:danger] = t('defaults.flash_message.not_created')
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id]) # 個別のポストidを取得
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end