Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :players
  resources :players
  post 'damage', to: 'characters#damage'
  post 'level_up', to: 'characters#level_up'
  resources :characters
  patch 'capture', to: 'characters#capture'
  patch 'heal', to: 'characters#heal'
  post 'characters/new', to: 'characters#create'
end
