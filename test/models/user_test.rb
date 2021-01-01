require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(username: "raaynaldo", password: "123", first_name: "Raynaldo", last_name: "Sutisna", email: "me@raaynaldo.com", birthday: "2020-01-31")
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "username should be valid" do
    @user.username = " "
    assert_not @user.valid?
  end

  test "password should be valid" do
    @user.password = " "
    assert_not @user.valid?
  end

  test "first_name should be valid" do
    @user.first_name = " "
    assert_not @user.valid?
  end

  test "last_name should be valid" do
    @user.last_name = " "
    assert_not @user.valid?
  end

  test "email should be valid" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "birthday should be valid" do
    @user.birthday = nil
    assert_not @user.valid?
  end
end
