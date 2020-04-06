Rails.application.routes.draw do
  devise_for :users
  resources :blogs
  get 'home', to: 'blogs#home'
  root 'blogs#home'
end
