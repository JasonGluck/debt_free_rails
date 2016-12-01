Rails.application.routes.draw do
  
  # get 'sessions/new'

  resources :users
  resources :sessions
  root to: "sessions#new"
  get 'hello_world', to: 'hello_world#index'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/signout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
