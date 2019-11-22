# frozen_string_literal: true

Rails.application.routes.draw do
  resources :products
  root 'products#index'

  resources :comments, only: %i[create update destroy]

  resources :orders, except: [:index]

  get 'basket', to: 'orders#index'

  resource :my, only: %i[show update] do
    get 'personal'
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users, only: %i[show index]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
