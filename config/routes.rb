Rails.application.routes.draw do
  get "/auth/:provider/callback", to: "sessions#github_create" #matches route in github you entered
  get 'auth/failure', to: redirect('/')
  delete 'signout', to: 'sessions#destroy', as: 'signout'
  root to: 'sessions#home'
  post '/login' => 'sessions#create'


  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/user' => 'users#show'

  resources :locations
  resources :restaurants
  resources :items

  resources :restaurants, only: [:show, :index] do
    resources :items
  end
end
