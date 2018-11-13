Rails.application.routes.draw do
  root "home_page#index"
  resources :resource_attributes
  resources :resources
  resources :resource_type_attributes
  resources :resource_types
  resources :providers
end
