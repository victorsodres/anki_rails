Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :decks
  resources :cards

  post '/session', to: 'session#create'
  get '/session', to: 'session#show'
  delete '/session', to: 'session#destroy'

end
