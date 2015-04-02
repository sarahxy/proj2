Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  post 'damage', to: 'pokemons#damage'
  post 'level_up', to: 'pokemons#level_up'
  resources :pokemons
  patch 'capture', to: 'pokemons#capture'
  patch 'heal', to: 'pokemons#heal'
  post 'pokemons/new', to: 'pokemons#create'
end
