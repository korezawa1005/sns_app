class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! # ログイン必須
  before_action :correct_user, only: [:edit, :update, :destroy] # 編集・削除アクション制限

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path, notice: "投稿を作成しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "投稿を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: '投稿を削除しました。' }
      format.turbo_stream # Turbo Streamリクエストの場合
    end
  end

private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to posts_path, alert: "他のユーザーの投稿を編集・削除することはできません。"
    end
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
