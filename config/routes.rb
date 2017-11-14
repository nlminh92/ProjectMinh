Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'sessions/new'


  root "homepage#index"
  # devise_scope :user do
    # root to: "devise/sessions#new"
  # end
  resources :homepage

  resources :homes
  resources :dashboards
  resources :products
  resources :collections
  get 'products/new'
  resources :cart
  get 'cart/index'
  resources :dashboardretailer
  get 'dashboardretailer/index'
  resources :profiles
  resources :connections
  resources :networks
  resources :active_networks
  resources :notifies
  resources :collection_brand
  resources :product_brand
  resources :my_orders
  resources :brand_orders
  resources :connection_showrooms, only: [:index, :create]
  get "retailler_notify" => "notifies#retailler"

#   devise_for :users, :controllers => {
#   sessions: 'user/sessions'
# }

  namespace :admin do
    resources :actives
    resources :active_orders
    resources :notifies
    resources :activities
    resources :active_connect
  end
end
