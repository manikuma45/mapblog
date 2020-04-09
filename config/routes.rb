Rails.application.routes.draw do
  resources :likes, only: [:create, :destroy]

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users, only: [:show, :index] do
    get 'likes', to: 'likes#like_blogs'
  end
  get 'users/blog_show'

  resources :blogs do
    get 'like_users', to: 'likes#users'
  end
  get 'home', to: 'blogs#home'
  root 'blogs#home'
end
