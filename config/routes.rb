Rails.application.routes.draw do
  get "/auth/:provider/callback", to: "sessions#github_create" #matches route in github you entered
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  root to: 'sessions#home'
  post '/login' => 'sessions#create'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/user' => 'users#show'

  get '/all_restaurants_in_database' => 'restaurants#all_restaurants_in_db'

  resources :locations
  resources :restaurants
  resources :items

  resources :restaurants, only: [:show, :index] do
    resources :items
  end
end
