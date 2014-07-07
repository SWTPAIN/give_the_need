class UsersController < ApplicationController
  def show
    @user =  User.find(params[:id])
    @message = Message.new
  end
end

