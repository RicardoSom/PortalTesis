Rails.application.routes.draw do
  devise_for :users
  resources :documents
  resources :schools
  #resources :users
  resources :careers
  get 'users', to: 'users#index'
  get 'users/:id', to: 'users#show', as: 'usuario'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'

  get '/students/new', to: 'students#nuevo', as: 'new_student'
  get  '/students/:id', to: 'students#show', as: 'student'
  get 'students/' , to: 'students#index', as: 'students'
  post 'students/' , to:'students#crear'
  delete  '/students/:id', to: 'students#destroy', as: 'destroy_student'

  get 'professors/new', to: 'professors#nuevo', as: 'new_professor'
  get 'professors', to: 'professors#index', as: 'professors'
  post 'professors/' , to:'professors#crear'

  delete  '/professors/:id', to: 'professors#destroy', as: 'destroy_professor'
  get  '/professors/:id', to: 'professors#show', as: 'professor'

  get "/pages/:page" => "pages#home"
end
