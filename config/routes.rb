Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
resources :items
resources :users, only: [:show] do
  collection do
    get :logout
  end
end 
resources :card, only: [:new, :show]
end
