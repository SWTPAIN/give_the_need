class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.creator = current_user
    if @comment.save
      flash[:info] = "Your comment is added"
      redirect_to post_path(@post)
    else
      render post_path(@post)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end