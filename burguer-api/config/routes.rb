Rails.application.routes.draw do

  resources :burguers, except: [:new, :edit]

  root 'burguers#index'
end
