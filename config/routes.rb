require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  mount Sidekiq::Web, at: '/sidekiq'
  resources :users, only: [:show] do
    resources :messages, only: [:new, :update, :create, :destroy]
  end
  root to: 'pages#front'
  resources :posts, only: [:new, :create, :show, :index] do
    resources :requests, only: [:create, :destroy]  
    resources :commitments, only:[:create, :update]
    collection do
      get 'search'
    end
  end
  get 'tags/:tag', to: 'posts#index', as: :tag
  get 'locations/:location', to:'posts#index', as: :location
  get 'messages', to:'messages#index', as: :messages
end
