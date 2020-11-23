Rails.application.routes.draw do

  get "/questions/random10", to: "questions#random10"
  
  resources :questions
  resources :tags
  resources :users
  resources :levels
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
