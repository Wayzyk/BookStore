Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}

  resources :authentications, only: [:destroy]

  resources :categories do
    resources :books, only: :index
  end

  resources :books, only: :show do
    resources :reviews
  end

  resources :order_items, only: [:create, :update, :destroy]

  resource :cart, only: [:show]

  resources :checkouts

  root 'pages#home'
end
