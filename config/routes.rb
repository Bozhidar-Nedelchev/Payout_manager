Rails.application.routes.draw do
  devise_for :users, constraints: { sign_in: false, sign_up: false }
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :admin do
  root 'home#index'
  resources :countries
  end
  resources :countries do 
    collection do
      get 'statistics' # Statistics action
      get 'export'     # Export action
    end
  end
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
