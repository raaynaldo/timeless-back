class UserSerializer < ActiveModel::Serializer
  attributes :username, :full_name, :first_name, :last_name
end
