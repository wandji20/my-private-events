Rails.application.routes.draw do
  resources :friendships
  resources :users
  resources :sessions
  resources :events
  root 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
