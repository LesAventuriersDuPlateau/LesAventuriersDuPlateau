Rails.application.routes.draw do
  resources :orders, only: [:create, :update, :destroy]
  resources :carts, except: [:index, :new, :edit]
  resources :events
  devise_for :users
  root to: "events#index"

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end
end
