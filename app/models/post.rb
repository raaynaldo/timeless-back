require "date"

class Post < ApplicationRecord
  has_many :post_tags
  has_many :tags, through: :post_tags
  belongs_to :user

  validates :body, :post_date, :user_id, presence: true
  before_validation :set_post_date_today

  protected

  def set_post_date_today
    if post_date.nil?
      self.post_date = DateTime.now()
    end
  end
end
