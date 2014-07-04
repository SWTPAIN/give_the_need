require 'rails_helper'

describe PostsController do
  describe "GET new" do
    it 'sets @video to a new post' do
      get :new
      expect(assigns(:post)).to be_instance_of Post
      expect(assigns(:post)).to be_new_record
    end
  end
  describe "GET show" do
    it 'sets @posts' do
      post = Fabricate(:post)
      get :show, id: post.id
      expect(assigns(:post)).to eq(post)
    end
    it 'renders the show template'
  end
end