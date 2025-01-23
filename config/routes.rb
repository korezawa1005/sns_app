Rails.application.routes.draw do
  resources :posts
  devise_for :users
  root to: "home#index"
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
end
