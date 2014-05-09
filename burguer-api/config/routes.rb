Rails.application.routes.draw do

  resources :orders, except: [:new, :edit]
  resources :products, except: [:new, :edit]

  root 'products#index'
end
