class CommitmentsController < ApplicationController
  before_action :authenticate_user!

  def create
    commitment = Commitment.new(post_id: params[:post_id], receiver_id: params[:receiver_id])
    if commitment.save
      flash[:info] = 'The commitment is made. You might contact with the receiver.'
      Message.sending_system_notice(commitment)
      redirect_to root_path
    else
      flash[:danger] = 'There is some probem. Please ask for admin.'
      redirect_to :back
    end
  end

  def update
    commitment = Commitment.find(params[:id])
    if params[:receiver_response]
      commitment.receiver_response = params[:receiver_response]
    else
      commitment.giver_response = params[:giver_response]
    end      
    commitment.save
    redirect_to :back
  end

end
