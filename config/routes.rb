Rails.application.routes.draw do
  resources :shares
  resources :comments
  resources :recipe_categories
  resources :ratings
  resources :recipes
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
