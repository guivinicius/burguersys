Rails.application.routes.draw do

  get 'tables/index'

  resources :orders, except: [:new, :edit]
  resources :products, except: [:new, :edit]
  resources :tables, only: [:index]

  root 'products#index'
end
