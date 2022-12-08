Rails.application.routes.draw do
  resources :cargo_ships, only:[:index, :show]

  resources :user_cargos, only:[:create, :index, :show, :update, :destroy]
  
  resources :users
  post "/signup", to: "users#create"
  post "/login", to: "jwt#create"
  delete "/logout", to: "jwt#destroy"
  get "/me", to: "users#show"
  delete "/me", to: "users#destroy"
  patch "/me", to: "users#update"
  put "/me", to: "users#update"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
