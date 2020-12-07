Rails.application.routes.draw do
  resources :reviews
  resources :orders
  resources :locations
  resources :items
  resources :carts
  resources :products
  resources :catches
  resources :fish
  mount RailsAdmin::Engine => '/god', as: 'rails_admin'
  devise_for :users, :controllers => {:sessions => "users/sessions"}
  root to: 'pages#bucket', constraints: lambda { |request| request.env['warden'].user.fisherman? }, as: "bucket"
  root to: 'pages#market'
  post '/order/all', to: 'orders#order'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
