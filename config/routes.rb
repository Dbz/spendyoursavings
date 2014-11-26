Rails.application.routes.draw do
  root :to => 'pages#home'
  resource :user, only: [:create]
  resources :sessions, only: [:create, :destroy]
  namespace :api do
    resources :listings, only: [:create, :show]
    get 'shops/featured_shops', to: 'shops#featured_shops'
    resources :shops, only: [:create, :show]
  end
end
