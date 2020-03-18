Rails.application.routes.draw do
  root "items#edit"
resources :items
end
