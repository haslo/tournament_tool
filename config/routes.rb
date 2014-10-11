Rails.application.routes.draw do

  root to: 'home#index'

  resource :about, only: [:show]
  resources :tournaments

end
