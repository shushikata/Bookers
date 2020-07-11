Rails.application.routes.draw do
  root :to => 'books#top'

  devise_for :users, controllers: { registrations: 'users/registrations' }
 
  resources :books
  
  resources :users, only: [:show, :index, :edit, :update, :create]

  get 'home/about' => 'homes#index'
end 
  