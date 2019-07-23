Rails.application.routes.draw do
  resources :places
  devise_for :users
  resources :events do
  	resources :comments
  end
  root 'events#index'
end
