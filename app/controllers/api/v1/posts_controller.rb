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
    new_post = Post.new(body: params[:body], user_id: current_user.id)
    # new_post = Post.last

    #image
    if params[:file]
      new_post.picture.attach(params[:file])
      # user.avatar.attach(io: params[:file], filename: "tes")
      new_post.image = url_for(new_post.picture)
    else
      new_post.image = params[:url]
    end

    #tags
    param_tags = params[:tags].split(",")
    tags = param_tags.map { |tag|
      Tag.find_or_create_by(name: tag.strip().downcase)
    }

    if new_post.save!
      new_post.tags.concat(tags)
      update_image = Post.last
      update_image.update(image: url_for(update_image.picture))
      byebug
      render json: update_image, root: "post", adapter: :json, serializer: PostSerializer, status: :created
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


# http://127.0.0.1:3001/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBZ3ciLCJleHAiOm51bGwsInB1ciI6ImJsb2JfaWQifX0=--5fba2c6d94868e33c5af818ef82db8c01b379d15/WhatsApp%20Image%202020-12-19%20at%209.18.34%20AM.jpeg
# http://127.0.0.1:3001/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBLdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--966ad5ad46002b11c9eec0e1dce7217f868640c3/WhatsApp%20Image%202020-12-19%20at%209.18.34%20AM.jpeg