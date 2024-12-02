Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "food_items/:id/recipes", to: "food_items#recipes", as: :food_item_recipes
  get "rewards", to: "food_items#rewards"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :food_items
  # Defines the root path route ("/")
  # root "posts#index"
end
