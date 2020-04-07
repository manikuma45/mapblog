Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: {
        registrations: 'users/registrations'
  }
  resources :users, only: [:show]

  resources :blogs
  get 'home', to: 'blogs#home'
  root 'blogs#home'
end
