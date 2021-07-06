Rails.application.routes.draw do

  root 'posts#index'

  resources :friendships, only: [:index, :create, :destroy] do
    member do
      get 'confirm'
    end
  end
  devise_for :users

  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show] do
    get :friends, :unconfirmed_requests, on: :member
  end

  resources :users, only: [:index, :show] do
    get :friends, :confirm, on: :member
  end

  


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
