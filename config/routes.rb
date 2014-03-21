Addemotion::Application.routes.draw do
  resources :memories

  get "static/index"
  resources :things
  resources :memories
  resource :sessions
  resources :users

  root 'static#index'
end
