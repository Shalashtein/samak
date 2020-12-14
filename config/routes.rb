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
  devise_for :users, controllers: {sessions: "users/sessions", registrations: "users/registrations"}
  root to: 'pages#bucket', constraints: lambda { |request| request.env['warden'].user.fisherman? unless request.env['warden'].user.nil? }, as: "bucket"
  root to: 'pages#market'
  post '/location/set', to: 'locations#set_loc'
  post '/order/multiple', to: 'orders#multiple'
  get '/fisherman/market', to: 'products#fisherman'
  get '/fisherman/account', to: 'pages#account'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
