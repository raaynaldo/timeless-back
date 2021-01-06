class Api::V1::PostsController < ApplicationController
  def show_user_posts
    user_posts = Post.search_post_by_user_id(params[:user_id])
    user_posts_by_year = user_posts.inject({}) { |memo, current|
      year = current.post_date.year.to_s
      current = PostSerializer.new(current)
      if memo[year].nil?
        memo[year] ||= [current]
      else
        memo[year] << current
      end
      memo
    }
    render json: { posts: user_posts_by_year }, status: :ok
  end

  def show_followee_posts
    #current_user
    followee_posts = Post.search_post_by_user_id(current_user.followee_ids)
    render json: followee_posts, root: "posts", adapter: :json, each_serialzer: PostSerializer, status: :ok
  end

  def create
    # body, image, user_id, tag
    post = post_params
    post[:user_id] = current_user.id
    new_post = Post.new(post)
    tags = params[:tags].map { |tag|
      Tag.find_or_create_by(name: tag.downcase)
    }
    if new_post.save
      new_post.tags.concat(tags)
      render json: new_post, root: "post", adapter: :json, serializer: PostSerializer, status: :created
    else
      render json: { message: "failed to create post", errors: new_post.errors }, status: :not_acceptable
    end
  end

  def destroy
  end

  private

  def post_params
    # params { user: {username: 'Chandler Bing', password: 'hi' } }
    params.require(:post).permit(:body, :image)
  end
end
