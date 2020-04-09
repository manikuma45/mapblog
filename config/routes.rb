Rails.application.routes.draw do
  resources :likes, only: [:create, :destroy]

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users, only: [:show] do
    get 'likes', to: 'likes#like_blogs'
  end
  get 'users/blog_show'

  resources :blogs
  get 'home', to: 'blogs#home'
  root 'blogs#home'
end
