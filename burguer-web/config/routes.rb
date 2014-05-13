Rails.application.routes.draw do

  get 'home/index'

  resources :tables, only: [:index, :show]
  resource :kitchen, only: [:show]

  root 'home#index'
end
