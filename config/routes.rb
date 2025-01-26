Rails.application.routes.draw do
  get "likes/create"
  get "likes/destroy"
  resources :posts
  devise_for :users
  root to: "home#index"
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  resources :posts do
    resource :like, only: [:create, :destroy]
  end
end
