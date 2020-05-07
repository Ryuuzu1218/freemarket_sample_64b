Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new2'
    post 'addresses', to: 'users/registrations#new3'
  end
  root 'items#index'

  # itemコントローラーrouting
  resources :items do
    member do
      get 'category_children', defaults: { format: 'json' }
      get 'category_grandchildren', defaults: { format: 'json' }
    end
  end

  resources :users, only: [:show] do
    collection do
      get :logout
    end
  end 

  resources :card, only: [:new, :create, :show, :destroy] do
    collection do
      post 'show', to: 'card#show'
    end
  end

  resources :transactions do
    member do
      get :confirm
    end
  end


end
