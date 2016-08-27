Rails.application.routes.draw do
  root to: 'products#index'
  resources :products
  resource  :order, only: [:show, :update]
  resources :order_items, only: [:create, :update, :destroy]
end
