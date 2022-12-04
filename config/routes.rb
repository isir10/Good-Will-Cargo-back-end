Rails.application.routes.draw do
  resources :cargo_ships, only:[:create, :index, :update, :destroy]
  resources :user_cargos, only:[:index, :show]
  resources :users
  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/me", to: "users#show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
