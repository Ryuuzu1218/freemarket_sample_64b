Rails.application.routes.draw do
resources :items
resources :users do
  collection do
    get '_new2'
    get '_new3'
    end
  end
end
