Rails.application.routes.draw do

  get '/', to: 'users#index'

  get '/signin', to: 'sessions#new' #sign in page
  # get '/home', to: 'users#show' #user home page
  get '/signout', to: 'sessions#destroy'
  # delete '/signout', to: 'sessions#destroy'

  resources :users
  resources :sessions
  resources :attractions
  resources :rides

  get '/attractions', to: 'attractions#show'

  # post "/rides/new", to: "rides#new"
  get '/rides/new', to: 'rides#new'
  post '/rides/new', to: 'rides#create'

  post '/attractions/new', to: 'attractions#show'


  root to: 'users#index'
end
