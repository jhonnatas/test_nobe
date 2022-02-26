Rails.application.routes.draw do


  devise_for :users

  root to: "home#index"

  resources :accounts
  resources :account_transactions

  post '/transference', to: 'accounts#transference' 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  
end
