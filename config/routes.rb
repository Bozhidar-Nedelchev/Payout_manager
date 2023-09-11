Rails.application.routes.draw do
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :countries
  resources :clients
  resources :merchant
  resources :brands
  resources :products
  resources :cards
  resources :applications
  resources :transactions
  get 'home/countries'
  get 'home/clients'
  get 'home/merchant'
  get 'home/brands'
  get 'home/products'
  get 'home/cards'
  get 'home/applications'
  get 'home/transactions'
  
end
