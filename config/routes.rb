Rails.application.routes.draw do

  get '/', to: 'users#index'
  get '/signin', to: 'sessions#new'
  get '/home', to: 'users#show'

  resources :users
  resources :sessions

  root to: 'users#index'
end
