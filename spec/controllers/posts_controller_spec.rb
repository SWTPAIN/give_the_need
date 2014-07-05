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
  describe "POST create" do
    context 'with successful post creation' do
      # session[user_id] = Fabricate(:user)

      # sign_in Fabricate(:user)
      it 'redirects to post index page' do
        post :create, post: Fabricate.attributes_for(:post) 
        expect(response).to redirect_to posts_path
      end 
      it 'set the flash info' do
        post :create, post: Fabricate.attributes_for(:post) 
        expect(flash[:info]).to be_present
      end
    end
    context 'with failed post creation' do
      it 'sets @post' do
        post :create, post: {title: 'something'}
        expect(assigns(:post)).to be_instance_of Post
      end
      it 'renders to the new template' do
        post :create, post: {title: 'something'}
        expect(response).to render_template :new
      end
      it 'set the flash error notice' do
        post :create, post: {title: 'something'}
        expect(flash[:danger]).to be_present
      end
    end
  end
end