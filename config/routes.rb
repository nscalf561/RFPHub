Rails.application.routes.draw do

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'




  resources :users

  get '/' => 'application#index'

  root 'application#index'

end
