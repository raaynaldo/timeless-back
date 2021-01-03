Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post "/users", to: "users#create"
      get "/profile", to: "users#show"
    
      post "/login", to: "authorization#create"
    
      get "/user_posts/:user_id", to: "posts#show_user_posts"
      get "/folowee_posts/", to: "posts#show_followee_posts"
    end
  end
  
  # post "/users", to: "users#create"
  # get "/profile", to: "users#show"

  # post "/login", to: "authorization#create"

  # get "/user_posts/:user_id", to: "posts#show_user_posts"
  # get "/folowee_posts/", to: "posts#show_followee_posts"
end
