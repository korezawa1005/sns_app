class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    post.likes.create!(user: current_user)
    redirect_to post, notice: "いいねしました"
  end

  def destroy
    post = Post.find(params[:post_id])
    like = post.likes.find_by(user: current_user) # post.likes 特定の投稿に関連するすべての「いいね」を取得
    like&.destroy # & ボッチ演算子 likeがnilだった時（いいねがないとき）に普通に呼び出すとエラーになる。&をつければnilでもエラーにならない
    redirect_to post, notice: "いいねを取り消しました"
  end
end
