Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get "/users", to: "users#index"
      post "/users", to: "users#create"
      get "/profile", to: "users#show"
      get "/followers/:id", to: "users#followers"
      get "/following/:id", to: "users#following"

      post "/login", to: "authorization#create"

      resource :posts, only: [:create]
      get "/user_posts/:user_id", to: "posts#show_user_posts"
      get "/folowee_posts/", to: "posts#show_followee_posts"

      get "/current_user_profile/", to: "users#show_current_user_profile"
      get "/user_profile/:username", to: "users#show_user_profile_by_username"
      post "/follow_unfollow", to: "users#follow_unfollow_user"
    end
  end

  # post "/users", to: "users#create"
  # get "/profile", to: "users#show"

  # post "/login", to: "authorization#create"

  # get "/user_posts/:user_id", to: "posts#show_user_posts"
  # get "/folowee_posts/", to: "posts#show_followee_posts"
end
