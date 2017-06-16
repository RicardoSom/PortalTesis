Rails.application.routes.draw do
  resources :documents
  resources :schools
  resources :users
  resources :careers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'documents#index'
end
