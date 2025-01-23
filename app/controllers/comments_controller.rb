class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(@post), notice: 'コメントを投稿しました。'
    else
      redirect_to post_path(@post), alert: 'コメントの投稿に失敗しました。'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
      redirect_to post_path(@comment.post), notice: 'コメントを削除しました。'
    else
      redirect_to post_path(@comment.post), alert: '他のユーザーのコメントは削除できません。'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
