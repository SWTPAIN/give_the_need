Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  root to: 'pages#front'
  resources :posts, only: [:new, :create, :show, :index] do
    resources :requests, only: [:create]  
    resources :commitments, only:[:create, :edit]
  end
end
