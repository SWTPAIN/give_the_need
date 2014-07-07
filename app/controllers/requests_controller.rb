class RequestsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @request = @post.requests.new(comment_params)
    @request.creator = current_user
    if @request.save
      flash[:info] = "Your comment is added"
      redirect_to post_path(@post)
    else
      flash[:danger] = "You can only make one request per post."
      redirect_to post_path(@post)
    end
  end

  # def destroy
  #   @request = Request.find(params[:id])
  #   if @request.destroy
  #     flash[:info] = 'The request is canceled'
  #   else
  #     flash[:danger] = 'There is some problem happering. Please contact admin.'
  #   end
  #   redirect_to :back
  # end

  private

  def comment_params
    params.require(:request).permit(:body)
  end
end