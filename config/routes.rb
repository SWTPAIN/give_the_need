Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#front'
  resources :posts, only: [:new, :create, :show]
end
