Rails.application.routes.draw do
  # get 'top', to: 'home#top'
  root 'home#top'

  get 'home', to: 'blogs#home'

  resources :relationships, only: [:create, :destroy]
  get 'relationships/following'
  get 'relationships/followers'

  resources :likes, only: [:create, :destroy]

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users, only: [:show, :index] do
    get 'likes', to: 'likes#index'
  end

  resources :blogs do
    get 'like_users', to: 'likes#users'
  end
end
