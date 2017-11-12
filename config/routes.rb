Rails.application.routes.draw do

  get '/', to: 'users#index'
  delete '/', to: 'users#index' #splash page with sign in/sign up
  get '/signin', to: 'sessions#new' #sign in page
  get '/home', to: 'users#show' #user home page

  resources :users
  resources :sessions

  root to: 'users#index'
end
