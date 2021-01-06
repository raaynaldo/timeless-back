class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def index
    users = User.where("username like ?", "%" + params[:username] + "%")
    render json: users
  end

  def create
    new_user = User.new(user_params)
    if new_user.save
      new_user.posts.build([{ body: "Born Today",
                              post_date: user_params[:birthday],
                              image: "https://images.unsplash.com/photo-1503431760783-91f2569f6802?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80" },
                            { body: "Welcome to Timeless", image: " https://images.unsplash.com/photo-1580191947416-62d35a55e71d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80" }])
      new_user.save
      token = encode_token(user_id: new_user.id)
      render json: { user: UserSerializer.new(new_user), token: token }, status: :created
    else
      render json: { message: "failed to create user", errors: new_user.errors }, status: :not_acceptable
    end
  end

  def show_current_user_profile
    user = User.find(current_user.id)
    user_posts_by_year = user.posts.inject({}) { |memo, current|
      year = current.post_date.year.to_s
      current = PostSerializer.new(current)
      if memo[year].nil?
        memo[year] ||= [current]
      else
        memo[year] << current
      end
      memo
    }
    render json: { user: UserSerializer.new(user), posts: user_posts_by_year }, status: :ok
  end

  def show_user_profile_by_username
    user = User.find_by_username(params[:username])
    if user.present?
      user_posts_by_year = user.posts.inject({}) { |memo, current|
        year = current.post_date.year.to_s
        current = PostSerializer.new(current)
        if memo[year].nil?
          memo[year] ||= [current]
        else
          memo[year] << current
        end
        memo
      }
      is_following = user.followers.find(current_user.id).exists?
      render json: { user: UserSerializer.new(user), posts: user_posts_by_year, following: is_following }, status: :ok
    else
      render json: { message: "user not found" }, status: :not_found
    end
  end

  def show
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :password_confirmation, :email, :birthday)
  end
end