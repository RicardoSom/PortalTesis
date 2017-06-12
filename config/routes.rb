Rails.application.routes.draw do
  resources :careers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'careers#index'
end
