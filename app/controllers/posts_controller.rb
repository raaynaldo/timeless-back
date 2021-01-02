class PostsController < ApplicationController
  def show_user_posts
    user_posts = Post.where(user_id: params[:user_id])
    render(json: user_posts, root: "posts", adapter: :json, each_serialzer: PostSerializer, status: :ok)
  end

  def show_followee_posts
    #current_user
  end
end
