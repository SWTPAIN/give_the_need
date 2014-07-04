Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#front'
  resource :posts, only: [:show, :new, :create]
end
