class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :full_name, :followers_count, :followee_count, :image

  def followers_count
    object.followers.count
  end

  def followee_count
    object.followees.count
  end
end
