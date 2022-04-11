Rails.application.routes.draw do
  resources :professions
  resources :field_of_studies
  resources :qualification_levels
  resources :unions
  resources :factions
  resources :religions
  resources :parties
  resources :electorates
  resources :candidates
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index"
end
