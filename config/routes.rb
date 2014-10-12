Rails.application.routes.draw do

  devise_for :accounts
  if Rails.env.development?
    local_ip = `ifconfig |grep inet`.split("\n").last.scan(/\d{1,3}/)[0..3].join('.')
    default_url_options :host => "#{local_ip}:3000"
    # start server with:
    # rails s -b 0.0.0.0
    # to enable IPv4 binding on all interfaces and make QR codes work
  end

  root to: 'tournaments#index'

  resource :about, only: [:show]

  # must be last, as it's kind of a catch-all
  resources :tournaments, path: '/', except: [:index]

end
