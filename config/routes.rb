Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :books do
    resources :reviews
  end
  root 'books#index'
end
