Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :decks
  resources :cards

  post '/token', to: 'token#create'
  get '/token/:token', to: 'token#show'
  delete '/token/:token', to: 'token#destroy'

end
