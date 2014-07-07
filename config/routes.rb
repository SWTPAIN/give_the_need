Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show] do
    resources :messages, only: [:index, :new, :update, :create, :destroy]
  end
  root to: 'pages#front'
  resources :posts, only: [:new, :create, :show, :index] do
    resources :requests, only: [:create, :destroy]  
    resources :commitments, only:[:create, :update]
  end
end
