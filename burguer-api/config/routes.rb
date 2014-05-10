Rails.application.routes.draw do

  scope path: '/api' do
    resources :orders, except: [:new, :edit, :destroy]
    resources :products, except: [:new, :edit, :destroy]
    resources :tables, only: [:index]
  end

  root 'products#index'
end
