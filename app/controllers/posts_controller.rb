class PostsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create]
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params.merge(user:current_user))
    if @post.save
      flash[:success] = 'Your post is created.'
      redirect_to posts_path
    else 
      flash[:danger] = "There are some problems in your post form. Please check"
      render new_post_path
    end
  end

  def show
    @post = Post.find(params[:id])
    @request = Request.new
  end

  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]).select{|post| post.status != :success}
    elsif params[:location]
      location = Location.find(params[:location])
      @posts = Post.all.select{|post| post.locations.include? location}
    else
    @posts = Post.all.select{|post| post.status != :success}
    end
  end

  def search
    @posts = Post.search(params[:search_term])    
    flash[:danger] = "There is no match result for the key word #{params[:search_term]}" if @posts == []
    render :index
  end

  private
  def post_params
    params.require(:post).permit!
  end

end