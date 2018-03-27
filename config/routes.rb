Rails.application.routes.draw do
  devise_for :users
  resources :notes
  resources :tags, only: [:index]

  root "home#index"
end
