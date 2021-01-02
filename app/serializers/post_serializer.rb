class PostSerializer < ActiveModel::Serializer
  attributes :user_id, :body, :post_date
  has_many :tags, serializer: TagSerializer
end
