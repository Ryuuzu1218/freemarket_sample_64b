Rails.application.routes.draw do
  root "items#index"
  devise_for :users
resources :items do
  resources :transactions,only: :new
end
resources :users do
  collection do
    get '_new2'
    get '_new3'
    end
  end
end
