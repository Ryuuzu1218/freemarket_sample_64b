Rails.application.routes.draw do
  devise_for :users
  root 'items#index'

  devise_scope :user do
    get 'users/new1', to: "devise/registrations#new1"
    get 'users/new2', to: "devise/registrations#new2"
    get 'users/new3', to: "devise/registrations#new3"
  end
resources :items
resources :users, only: [:show] do
  collection do
    get :logout
  end
end 
resources :card, only: [:new, :show]
end
