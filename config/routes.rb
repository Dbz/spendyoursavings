Rails.application.routes.draw do
  root :to => 'pages#home'
  namespace :api, defaults: {format: :json} do
    get 'listings/search', to: 'listings#search'
    resources :listings, only: [:create, :show]
    
    get 'shops/:id/search', to: 'shops#search'
    get 'shops/featured_shops/:num', to: 'shops#featured_shops'
    resources :shops, only: [:create, :show]
    
    resource :sessions, only: [:create, :destroy]
    resources :users, only: [:create]
    
    post 'cart/:id', to: 'carts#change'
    resource :cart, only: [:show]
  end
end
