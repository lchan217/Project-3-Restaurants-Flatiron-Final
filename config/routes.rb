Rails.application.routes.draw do
  #root 'application#welcome'

  # get '/login' => 'sessions#login'
  # post '/login' => 'sessions#create'
  # post '/logout' => 'sessions#destroy'

  get "/auth/:provider/callback", to: "sessions#create" #matches route in github you entered
  get 'auth/failure', to: redirect('/')
  delete 'signout', to: 'sessions#destroy', as: 'signout'
  root to: 'sessions#new'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/user' => 'users#show'
end
