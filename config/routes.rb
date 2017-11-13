Rails.application.routes.draw do

  get '/', to: 'users#index'

  get '/signin', to: 'sessions#new' #sign in page
  get '/home', to: 'users#show' #user home page
  # get '/signout', to: 'sessions#destroy'
  delete '/signout', to: 'sessions#destroy'

  resources :users
  resources :sessions
  resources :attractions

  get '/attractions', to: 'attractions#show'


  root to: 'users#index'
end
