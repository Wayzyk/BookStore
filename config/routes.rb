Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}
  root 'pages#home'

  resources :authentications, only: [:destroy]

  resources :categories

  match '/catalog', to: 'books#index', via: 'get'

  resources :books, only: [:show, :index] do
    resources :reviews
  end

  resources :order_items, only: [:create, :update, :destroy]

  resource :cart, only: [:show]

  resources :checkouts

  resources :addresses

  match '/settings', to: 'addresses#new', via: 'get'

  resources :billing_addresses, controller: 'addresses', type: 'Billing Address'
  resources :shipping_addresses, controller: 'addresses', type: 'Shipping Address'

end
