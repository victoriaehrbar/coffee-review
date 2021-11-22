Rails.application.routes.draw do
  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'

  get '/auth/google_oauth2', to: 'sessions#omniauth'
  
  get '/auth/:provider/callback' => 'sessions#create'

  resources :reviews
  resources :coffees do
    resources :reviews, only: [:new, :index]
  end
  
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
