class CommitmentsController < ApplicationController
  def create
    commitment = Commitment.new(post_id: params[:post_id], receiver_id: params[:receiver_id])
    if commitment.save
      flash[:info] = 'The commitment is made. You can exchange contact with the receiver.'
      redirect_to root_path
    else
      flash[:danger] = 'There is some probem. Please ask for admin.'
      redirect_to :back
    end
  end
end
