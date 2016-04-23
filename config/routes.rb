Rails.application.routes.draw do
  root 'products#index'
  devise_for :users

  resources :products, only: [:show] do
    resource :cart, only: :create
  end

  namespace :admin do
    root 'base#root'

    resources :products, except: [:show]
    resources :product_kinds, except: [:show]
  end
end
