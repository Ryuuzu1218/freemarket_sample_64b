Rails.application.routes.draw do
  devise_for :users
  root 'mypages#index'
  resources :mypages
# resources :items
# resources :users do
#   collection do
#     get '_new2'
#     get '_new3'
#     end
#   end
end
