class RequestsController < ApplicationController
before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @request = @post.requests.new(comment_params)
    @request.creator = current_user
    if @request.save
      flash[:success] = "Your request is added"
      redirect_to post_path(@post)
    else
      flash[:danger] = "You can only make one request per post."
      redirect_to post_path(@post)
    end
  end


  private

  def comment_params
    params.require(:request).permit(:body)
  end
end