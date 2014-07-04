require 'rails_helper'

describe PostsController do
  describe "GET new" do
    it 'sets @post to a new post' do
      get :new
      expect(assigns(:post)).to be_instance_of Post
      expect(assigns(:post)).to be_new_record
    end
  end
  describe "GET show" do
    it 'sets @post' do
      post = Fabricate(:post)
      get :show, id: post.id
      expect(assigns(:post)).to eq(post)
    end
  end
  describe "GET index" do
    it 'set @posts ' do
      post1 = Fabricate(:post)
      post2 = Fabricate(:post)
      get :index
      expect(assigns(:posts)).to match_array([post1, post2])
    end
  end
end