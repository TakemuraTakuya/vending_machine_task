require "minitest/autorun"
require_relative "../lib/user"

class UserTest< Minitest::Test
  
  def setup
    @user = User.new(12,"男性")
  end

  def test_user_age
    assert_equal 12, @user.age
  end

  def test_user_gender
    assert_equal "男性", @user.gender
  end

  def test_false_user_age
    refute_equal 20, @user.age
  end

  def test_false_user_gender
    refute_equal "女性", @user.gender
  end
end

