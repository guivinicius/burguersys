Rails.application.routes.draw do

  resources :products, except: [:new, :edit]

  root 'products#index'
end
