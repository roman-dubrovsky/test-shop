Rails.application.routes.draw do
  root 'products#index'
  devise_for :users

  resources :products, only: [:show] do
    resource :cart, only: [:create, :destroy]
  end
  resources :orders, only: [:create, :show, :new]

  namespace :admin do
    root 'base#root'

    resources :products, except: [:show]
    resources :product_kinds, except: [:show]
  end
end
