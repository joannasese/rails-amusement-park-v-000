Rails.application.routes.draw do

  get '/', to: 'users#index'

  get '/signin', to: 'sessions#new' #sign in page
  get '/home', to: 'users#show' #user home page
  delete '/signout', to: 'users#destroy'

  resources :users
  resources :sessions
  resources :attractions

  root to: 'users#index'
end
