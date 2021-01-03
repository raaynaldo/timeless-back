class User < ApplicationRecord
  has_many :posts
  has_many :followed_users, foreign_key: :follower_id, class_name: "UserFollower"
  has_many :followees, through: :followed_users
  has_many :following_users, foreign_key: :followee_id, class_name: "UserFollower"
  has_many :followers, through: :following_users

  has_secure_password

  validates :email, :username, uniqueness: true, presence: true
  validates :password, :first_name, :last_name, :birthday, presence: true

  def full_name
    self.first_name + " " + self.last_name
  end

  def followee_ids
    self.followees.map(&:id)
  end
end
