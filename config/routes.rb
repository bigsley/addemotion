Addemotion::Application.routes.draw do
  resources :memories

  get "static/index"
  resources :things
  resources :memories
  resources :sessions
  resources :users

  root 'static#index'
end
