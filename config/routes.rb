Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :categories do
    resources :expenses, only: [ :index, :new, :create ]
  end
  resources :expenses, only: [ :edit, :update, :destroy ]
  resources :goals
  get '/introduction', to: 'pages#intro'
end

