require "test_helper"
require "pry"

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    # user = User.first_or_create(username: "raaynaldo", first_name: "Raynaldo", password: "123", last_name: "Sutisna", email: "me@raaynaldo.com", birthday: "2020-01-31")
    @post = Post.new(body: "Win a lottery", image: "", post_date: nil, user_id: User.first.id)
  end

  test "post should be valid" do
    assert @post.valid?
  end

  test "body should be present" do
    @post.body = " "
    assert_not @post.valid?
  end

  test "user_id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end
end
