Rails.application.routes.draw do
  # resources :exercises
  # resources :blocks
  resources :workouts, only: [:index, :show]

  root "workouts#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
