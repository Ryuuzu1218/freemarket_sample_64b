Rails.application.routes.draw do
  root "items#index"
  devise_for :users
  root 'items#index'
resources :items
resources :users 
end
