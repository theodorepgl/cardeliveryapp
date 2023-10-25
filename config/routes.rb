Rails.application.routes.draw do
  get 'welcome/index'
  get 'reviews/new'
  get 'reviews/create'
  get 'bookings/index'
  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/show'
  get 'bookings/edit'
  get 'bookings/update'
  get 'users/new'
  get 'users/create'
  devise_for :users
  root "welcome#index"
  resources :users, only: [:new, :create]
  # resources :sessions, only: [:new, :create, :destroy]
  resources :bookings, except: [:destroy] do
    resources :reviews, only: [:new, :create]
  end
end
