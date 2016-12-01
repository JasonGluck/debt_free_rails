Rails.application.routes.draw do
  
  # get 'sessions/new'

  resources :users
  resources :sessions

  get 'hello_world', to: 'hello_world#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
