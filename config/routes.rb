Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :categories do
    resources :expenses, only: [ :index, :new, :create ]
  end
  resources :expenses, only: [ :edit, :update, :destroy ]
  resources :goals
  get '/introduction', to: 'pages#intro'

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end

