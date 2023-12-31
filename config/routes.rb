Rails.application.routes.draw do
  resources :orders, only: [:create, :update, :destroy]
  resources :carts, except: [:index, :new, :edit]
  resources :events
  resources :profil_users, only: [:show]
  delete "profil_user_delete" , to: 'profil_users#delete'
  devise_for :users
  resources :pseudo
  root to: "events#index"
  resources :admins 


  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end
end
