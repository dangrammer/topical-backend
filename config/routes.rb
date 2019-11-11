Rails.application.routes.draw do
  resources :articles
  resources :clippings
  resources :collections
  resources :users #, only: [:create]
  post '/login', to: 'auth#create'
  # get '/profile', to: 'users#profile' # is this needed????
  # resources :notes
end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html