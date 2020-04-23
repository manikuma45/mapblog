# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#top'

  get 'home', to: 'blogs#home'

  resources :relationships, only: %i[create destroy]
  get 'relationships/following'
  get 'relationships/followers'

  resources :likes, only: %i[create destroy]

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users, only: %i[show index] do
    get 'likes', to: 'likes#index'
  end

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :blogs do
    get 'like_users', to: 'likes#users'
    resources :comments
  end
end
