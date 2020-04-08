Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users, only: [:show]
  get 'users/blog_show'

  resources :blogs
  get 'home', to: 'blogs#home'
  root 'blogs#home'
end
