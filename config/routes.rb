Rails.application.routes.draw do
  resources :blogs
  get 'home', to: 'blogs#home'
end
