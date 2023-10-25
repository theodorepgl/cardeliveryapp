Rails.application.routes.draw do
  devise_for :users
  root "welcome#index"
  resources :users, only: [:new, :create]
  # resources :sessions, only: [:new, :create, :destroy]
  resources :bookings, except: [:destroy] do
    resources :reviews, only: [:new, :create]
  end
end
