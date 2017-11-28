Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  get '/signup' => 'users#new', as: :signup
  post '/signup' => 'users#create', as: :new_user
  get '/login'  => 'sessions#new', as: :login
  post '/login' => 'sessions#create' 
  delete '/logout' => 'sessions#destroy', as: :logout
  get '/map' => 'searches#show', as: :map

  resource :users, except: :new do
    collection do
      resources :reports 
    end
  end
  
  resource :geocoder
  resource :search, except: :index

end
