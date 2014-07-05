class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    # require 'pry'; binding.pry
    @post = Post.new(post_params.merge(user:current_user))
    if @post.save
      flash[:info] = 'Your registration is succeeded. Please sign in.'
      redirect_to posts_path
    else 
      flash[:danger] = "There are some problems in your post form. Please check"
      render new_post_path
    end
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