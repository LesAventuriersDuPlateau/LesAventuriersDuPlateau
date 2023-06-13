Rails.application.routes.draw do
  resources :orders, only: [:create, :update, :destroy]
  resources :carts, except: [:index, :new, :edit]
  resources :events
  devise_for :users
  root to: "events#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
