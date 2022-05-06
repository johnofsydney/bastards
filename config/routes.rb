Rails.application.routes.draw do
  resources :professions
  resources :field_of_studies
  resources :qualification_levels
  resources :unions
  resources :factions


  resources :electorates
  resources :candidates
  resources :about
  resources :faqs
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'genders' => 'genders#index'
  get 'home/search' => 'home#search'

  # Defines the root path route ("/")
  root to: "home#index"
end
