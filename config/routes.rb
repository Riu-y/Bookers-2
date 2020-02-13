Rails.application.routes.draw do
  # get 'users/show'
  devise_for :users
  # root'books#image'
  # resources :books, only:[:new, :create, :index, :show, :destroy]
  resources :books
  resources :users, only: [:show]
 end