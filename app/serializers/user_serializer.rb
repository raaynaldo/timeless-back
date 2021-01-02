class UserSerializer < ActiveModel::Serializer
  attributes :username, :full_name, :first_name, :last_name, :followers_count, :followee_count

  def followers_count
    object.followers.count
  end

  def followee_count
    object.followees.count
  end
end
