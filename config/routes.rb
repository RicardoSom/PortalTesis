Rails.application.routes.draw do
  devise_for :users
  resources :documents
  resources :schools
  #resources :users
  resources :careers
  get 'users' => 'users#index'
  get 'user' => 'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'documents#index'
end
