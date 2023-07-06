# frozen_string_literal: true

Rails.application.routes.draw do
  get 'items/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :items, only: [:index]
  resources :users, only: [:show] # TODO: add endpoints for :new, :create, :edit, :update, :destroy
end
