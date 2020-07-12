Rails.application.routes.draw do
  root :to => 'books#top'

  devise_for :users
 
  resources :books
  
  resources :users, only: [:show, :index, :edit, :update, :create]

  get 'home/about' => 'homes#index'
end 
  