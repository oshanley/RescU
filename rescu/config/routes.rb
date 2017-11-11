Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  get '/signup' => 'users#new', as: 'signup'
  get '/login'  => 'sessions#new', as: :login
  post '/login' => 'sessions#create' 
  delete '/logout' => 'sessions#destroy', as: :logout

  resources :users, :sessions
end
