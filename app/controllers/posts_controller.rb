class PostsController < ApplicationController
  def index
		@q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
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
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order(created_at: :desc)
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), success: t('defaults.flash_message.updated')
    else
      flash.now
      flash.now[:danger] = t('defaults.flash_message.not_updated')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    post = current_user.posts.find(params[:id])
    post.destroy!
    redirect_to posts_path, flash: { danger: t('defaults.flash_message.deleted') }, status: :see_other
  end

  # お気に入りがない時のメソッドの定義
  private

  def post_params
    params.require(:post).permit(:title, :body, :previous_carrier, :new_carrier, :price_difference, :device_payment, :purchase_method)
  end
end