require 'sidekiq/web'
require 'admin_constraint'

Rails.application.routes.draw do
  root 'messages#index'

  resources :connection_events, only: [:index]
  resources :messages, only: %i[index show]
  resources :roles
  resources :servers do
    get :admin, on: :collection
  end
  resources :ssh_keys, only: %i[index new create destroy]
  resources :users, only: %i[index update create]
  resources :votekick_events, only: [:index]

  post '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: 'sessions#failure'
  delete '/auth', to: 'sessions#destroy', as: :logout

  mount Sidekiq::Web => '/sidekiq', constraints: AdminConstraint.new
end
