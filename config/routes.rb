Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new2'
    post 'addresses', to: 'users/registrations#new3'
  end
  root 'items#index'

  # devise_scope :user do
  #   get 'users/new1', to: "devise/registrations#new1"
  #   get 'users/new2', to: "devise/registrations#new2"
  #   get 'users/new3', to: "devise/registrations#new3"
  # end

  # itemコントローラーrouting
  resources :items do
    collection do
      get 'category_children', defaults: { format: 'json' }
      get 'category_grandchildren', defaults: { format: 'json' }
    end
  end

  resources :users, only: [:show] do
    collection do
      get :logout
    end
  end 
  resources :card, only: [:new, :show]
end
