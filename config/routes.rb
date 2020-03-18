Rails.application.routes.draw do
  devise_for :users
  root "items#index"
resources :items
resources :users do
  collection do
    get '_new2'
    get '_new3'
    end
  end
end
