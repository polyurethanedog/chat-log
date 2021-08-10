Rails.application.routes.draw do
  root 'messages#index'

  resources :messages, only: [:index]
  resources :log_files, only: [:create]

  post '/auth/:provider/callback', to: 'sessions#create'
  delete '/auth', to: 'sessions#destroy', as: :logout
end
