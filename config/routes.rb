Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :user
  resources :book
  resources :like
  resources :request
  resources :favorite
  resources :book_status
  resources :activity
  resources :relationship
  resources :category
  resources :review
end

