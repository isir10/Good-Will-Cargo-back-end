Rails.application.routes.draw do
  resources :cargo_ships, only:[:index, :show]

  resources :user_cargos, only:[:create, :index, :show, :update, :destroy]

  resources :users

  post "/signup", to: "users#create"
  
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/me", to: "users#show"
 
end
