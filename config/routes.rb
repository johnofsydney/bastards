Rails.application.routes.draw do
  resources :careers
  resources :electorates
  resources :candidates
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index"
end
