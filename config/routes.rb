Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "/users", to: 'users#create'
  get "/profile", to: 'users#show'
  
  post "/login", to: 'authorization#create'
end