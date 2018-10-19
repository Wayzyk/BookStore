Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :categories do
    resources :books, only: :index 
  end

resources :books, only: :show do
  resources :reviews
end
  root 'pages#home'
end
