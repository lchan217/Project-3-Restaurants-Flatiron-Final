Rails.application.routes.draw do
  root 'application#welcome'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/home' => 'users#home'
end
