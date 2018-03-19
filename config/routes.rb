Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#home'
  get 'users/signin', to: 'users#signin'
  post 'users/login', to: 'users#login'
  get 'users/admin', to: 'users#admin'
  get 'users/seller', to: 'users#seller'
  get 'users/buyer', to: 'users#buyer'
  post 'users/accept', to: 'users#accept'
  post 'users/buyeraccept', to: 'users#buyeraccept'
  post 'users/buyerdecline', to: 'users#buyerdecline'
  post 'users/decline', to: 'users#decline'
  get 'users/logout', to: 'users#logout'
  post 'users/adminlogin', to: 'users#adminlogin'
  get 'users/sellershow', to: 'users#sellershow'
  get 'users/buyershow', to: 'users#buyershow'
  get 'orders/buyernotif', to: 'orders#buyernotif'
  post 'orders/accept', to: 'orders#accept'
  post 'orders/decline', to: 'orders#decline'
  resources :users
  resources :vendors
  resources :customers
  resources :orders

end
