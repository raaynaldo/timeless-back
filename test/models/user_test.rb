require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(username: "raaynaldo", password: "123", first_name: "Raynaldo", last_name: "Sutisna", email: "raynaldo_sutisna@example.com", birthday: "2020-01-31")
    john = User.create!(first_name: 'John', last_name: 'Doe', username: "johnd", email: "john_doe@example.com", password: "123", birthday: "1990-01-01")
    bryce = User.create!(first_name: 'Bryce', last_name: 'Moore', username: "brycem", email: "bryce_moore@example.com", password: "123", birthday: "1991-01-01")
    matteo = User.create!(first_name: 'Matteo', last_name: 'Ricci', username: "matteor", email: "matteo_ricci@example.com", password: "123", birthday: "1992-01-01")
    @user.followers += [john, bryce, matteo]
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "username should be present" do
    @user.username = " "
    assert_not @user.valid?
  end

  test "password should be present" do
    @user.password = " "
    assert_not @user.valid?
  end

  test "first_name should be present" do
    @user.first_name = " "
    assert_not @user.valid?
  end

  test "last_name should be present" do
    @user.last_name = " "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "birthday should be present" do
    @user.birthday = nil
    assert_not @user.valid?
  end
end
