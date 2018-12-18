Rails.application.routes.draw do
  resources :hetzner_servers
  root "home_page#index"
end
