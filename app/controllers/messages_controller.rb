class MessagesController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :update]

  def index
    @sent_messages = current_user.displayable_sent_messages        
    @received_messages = current_user.displayable_received_messages
    @message = Message.new
  end

  def create
    if sent_to
      @message = Message.new(message_params)
      @message.sender = current_user
      @message.recepient = sent_to
      if @message.save
        flash[:success] = "Message has been sent"
      end
    else
      flash[:danger] = 'There is no such user. Please check the username.'
    end
    redirect_to :back 
  end

  def update
    @message = Message.find(params[:id])
    @message.read_at ||= Time.now
    @message.save
    respond_to do |format|
      format.js      
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.mark_deleted(User.find(params[:user_id]))
    flash[:info] = "Message deleted."
    redirect_to :back 
  end

  private 

  def sent_to
    recipient = User.find_by_username(params.require(:message)[:to])
  end

  def message_params
    params.require(:message).permit(:subject,:body)
  end

end