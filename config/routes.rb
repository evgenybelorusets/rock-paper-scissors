Rails.application.routes.draw do
  root 'home#index'
  resources :throws, only: :create
end
