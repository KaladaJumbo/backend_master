Rails.application.routes.draw do

  get "/questions/random10", to: "questions#random10"
  get "/questions/chords", to: "questions#random_chords"
  get "/questions/custom/:tag", to: "questions#random_custom"
  post "/login", to: "users#login"
  get "/login/user", to: "users#show"
  
  resources :questions
  resources :tags
  resources :users, only: [:create]
  resources :levels
end
