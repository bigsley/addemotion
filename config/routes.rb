Addemotion::Application.routes.draw do
  get "static/index"
  resources :things

  root 'static#index'
end
