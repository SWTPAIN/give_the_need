class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    # require 'pry'; binding.pry
    Post.create(post_params.merge(user:current_user))
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
  end



  def index
    @posts = Post.all
  end

  private
  def post_params
    params.require(:post).permit!
  end

end