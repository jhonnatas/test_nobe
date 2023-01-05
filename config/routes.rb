Rails.application.routes.draw do

  devise_for :users

  root to: "home#index"

  post '/transference', to: 'accounts#transference' 

  resources :accounts
  resources :account_transactions
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
