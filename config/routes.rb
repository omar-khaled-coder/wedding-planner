Rails.application.routes.draw do
  resources :bookings
  resources :listings
  devise_for :users
  root to: "listings#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :listings, only: [:create, :show, :update]
  resources :bookings, only: [:create, :show, :update]

  get "/dashboard", to: "pages#dashboard"
end
