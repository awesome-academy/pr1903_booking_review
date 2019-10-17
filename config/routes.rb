# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :books
  resources :likes
  resources :requests
  resources :favorite_books
  resources :book_statuses
  resources :activities
  resources :relationships
  resources :categories
  resources :reviews
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users do 
    member do
      get :following, :followers, :liked_books
    end
  end

  resources :relationships, only: [:create, :destroy]

  root "books#index"
  
end

