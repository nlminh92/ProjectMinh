Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'sessions/new'


  root "homepage#index"
  resources :homes
  resources :dashboards
  resources :products
  resources :collections
  get 'products/new'
  resources :brands
  get 'brands/index'
  resources :retailers
  get 'retailers/index'
  resources :blogs
  get 'blogs/index'
  resources :contacts
  get 'contacts/index'
  resources :cart
  get 'cart/index'
  resources :profiles
  resources :connections
  resources :networks
  resources :active_networks

#   devise_for :users, :controllers => {
#   sessions: 'user/sessions'
# }

  namespace :admin do
    resources :actives
  end
end
