Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :shops do
    resources :reviews, only: [ :new, :create, :destroy ]
  end
  resources :reviews, only: [ :destroy ]
  resources :products
  resources :carts, only: [:show, :new, :update] do
    post '/:product_id', to: 'cart#add_item_to_cart'
    delete '/:product_id', to: 'cart#remove_item_from_cart'
  end
  get '/dashboard', to: 'products#dashboard'
end
