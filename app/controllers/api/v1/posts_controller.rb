class Api::V1::PostsController < ApplicationController
  def show_user_posts
    user_posts = Post.search_post_by_user_id(params[:user_id])
    render(json: user_posts, root: "posts", adapter: :json, each_serialzer: PostSerializer, status: :ok)
  end

  def show_followee_posts
    #current_user
    followee_posts = Post.search_post_by_user_id(current_user.followee_ids)
    render(json: followee_posts, root: "posts", adapter: :json, each_serialzer: PostSerializer, status: :ok)
  end

  def create
    # body, image, user_id, tag
  end

  def destroy
  end
end
