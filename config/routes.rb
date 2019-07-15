Rails.application.routes.draw do
  resources :places
  devise_for :users
  resources :events
  root 'events#index'
end
