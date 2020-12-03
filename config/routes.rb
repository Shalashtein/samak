Rails.application.routes.draw do
  resources :carts
  resources :products
  resources :catches
  resources :fish
  mount RailsAdmin::Engine => '/god', as: 'rails_admin'
  devise_for :users
  root to: 'pages#market'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
