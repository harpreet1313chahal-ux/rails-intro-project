Rails.application.routes.draw do
  root "home#index"

  resources :books, only: [:index, :show]
  resources :authors, only: [:index, :show]
  resources :categories, only: [:index, :show]

  get "about", to: "home#about"
  get "dataset", to: "home#dataset"
end