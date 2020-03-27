Rails.application.routes.draw do
  resources :items
  resources :dishes
  resources :dish_groups
  resources :restaurants
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
