Addemotion::Application.routes.draw do
  resources :memories

  get "static/index"
  resources :things
  resources :memories
  resources :sessions

  root 'static#index'
end
