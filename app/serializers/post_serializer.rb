class PostSerializer < ActiveModel::Serializer
  attributes :user_id, :body, :post_date
end
