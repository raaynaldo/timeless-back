class PostSerializer < ActiveModel::Serializer
  attributes :user_id, :body, :post_date, :image
  has_many :tags, serializer: TagSerializer
end
