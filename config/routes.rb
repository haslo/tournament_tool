Rails.application.routes.draw do

  devise_for :accounts

  if Rails.env.development? && defined?(Rails::Server)
    ip_candidates = `ifconfig |grep inet`.split("\n").map{|local_ip| local_ip.scan(/\d{1,3}/)[0..3].join('.')}
    local_ip = ip_candidates.select{|ip| ip =~ /\A192\.168\./}.first
    local_ip = ip_candidates.select{|ip| ip =~ /\A10\./}.first unless local_ip.present?
    local_ip = ip_candidates.first unless local_ip.present?
    local_host = "#{local_ip}:#{Rails::Server.new.options[:Port]}"
    puts "[#{I18n.l(Time.zone.now, format: :iso_datetime)}] DEVELOPMENT Host detected, using #{local_host} for QR codes"
    default_url_options :host => local_host
    # start server with:
    # rails s -b 0.0.0.0
    # to enable IPv4 binding on all interfaces and make QR codes work
  end

  root to: 'tournaments#index'

  resource :about, only: [:show]
  resources :leagues
  resources :stages
  resources :participants, only: [:create, :update, :destroy]

  # must be last, as it's kind of a catch-all
  resources :tournaments, path: '/', except: [:index] do
    member do
      post :sort
      post :default_stages
    end
  end

end
