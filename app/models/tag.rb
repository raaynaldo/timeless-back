class Tag < ApplicationRecord
  has_many :post_tags
  has_many :posts, through: :post_tags

  validates :name, presence: true

  before_save :lowercase_name

  private
  def lowercase_name
    self.name = self.name.downcase
  end
end
