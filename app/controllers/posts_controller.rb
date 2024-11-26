class PostsController < ApplicationController
  def index
    @q = Post.ransack(params[:q])

    # 検索フォームからのパラメータがある場合は検索結果を表示
    if params[:q].present?
      @posts = @q.result(distinct: true).includes(:user).order(created_at: :desc)
    else
      # そうでない場合は全ての投稿を表示
      @posts = Post.all.includes(:user).order(created_at: :desc)
    end
  end

  # 検索候補
  def search_candidates
    return if params[:keyword].blank? || params[:keyword].length < 2
  
    @candidates = Post.where("body LIKE ?", "%#{params[:keyword]}%")
                    .select(:body)
                    .distinct
                    .limit(5)
                    .pluck(:body)
  
    respond_to do |format|
      format.turbo_stream {
        render turbo_stream: turbo_stream.update(
          "search-candidates",
          partial: "posts/search_candidates",
          locals: { candidates: @candidates }
        )
      }
    end
  end

  # 検索結果
  def search
    # title_eq パラメータをenumの値に変換
    if params[:q] && params[:q][:title_eq].present?
      params[:q][:title_eq] = Post.titles[params[:q][:title_eq]]
    end

    # 検索のパラメーターの指定
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).includes(:user).order(created_at: :desc)

    render :index # index.html.erb をレンダリング
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