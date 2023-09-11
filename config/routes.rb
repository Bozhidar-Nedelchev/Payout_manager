Rails.application.routes.draw do
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
end
