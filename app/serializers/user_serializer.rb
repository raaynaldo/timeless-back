class UserSerializer < ActiveModel::Serializer
  attributes :username, :full_name, :followers, :first_name, :last_name
end
