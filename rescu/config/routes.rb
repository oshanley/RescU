Rails.application.routes.draw do
  get 'reports/new'

  get 'reports/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  get '/signup' => 'users#new', as: 'signup'
  get '/login'  => 'sessions#new', as: :login
  post '/login' => 'sessions#create' 
  delete '/logout' => 'sessions#destroy', as: :logout
  get '/reports/new' => 'reports#new', as: :new_report

  resources :users, :sessions, :reports
end
