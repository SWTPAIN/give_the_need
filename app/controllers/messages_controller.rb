class MessagesController < ApplicationController
  def new
    @message = Message.new
    if params[:reply_to]
      @reply_to = User.find_by_username(:params[:reply_to])
      @message.recepient_id = @reply_to.id unless @reply_to.nil?
    end
  end

  def create
    if sent_to
      @message = Message.new(message_params)
      @message.sender = current_user
      @message.recepient = sent_to
      if @message.save
        flash[:info] = "Message has been sent"
        redirect_to user_path(current_user)
      else
        render :new
      end
    else
      flash[:danger] = 'There is no such user. Please check the username.'
      redirect_to user_path(current_user)
    end
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