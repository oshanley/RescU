Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  get '/signup' => 'users#new', as: :signup
  post '/signup' => 'users#create', as: :new_user
  get '/login'  => 'sessions#new', as: :login
  post '/login' => 'sessions#create' 
  delete '/logout' => 'sessions#destroy', as: :logout

  resources :users, except: :new do
    resources :reports 
  end
  
  resource :geocoder
end
