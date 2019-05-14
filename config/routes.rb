Rails.application.routes.draw do

  resources :cheeses
  resources :boards

  get "/auth/:provider/callback", to: "sessions#github_create" #matches route in github you entered
  get 'auth/failure', to: redirect('/')
  delete 'signout', to: 'sessions#destroy', as: 'signout'
  root to: 'sessions#home'
  post '/login' => 'sessions#create'

  get '/welcome' => 'application#welcome'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/user' => 'users#show'
end
