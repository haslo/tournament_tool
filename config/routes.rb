Rails.application.routes.draw do

  root to: 'home#index'

  resource :about, only: [:show]
  resources :tournaments

  # must be last, as it's kind of a catch-all
  resources :home, only: [:show], path: '/'

end
