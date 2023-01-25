require "minitest/autorun"
require_relative "../lib/main"

class MainTest < Minitest::Test
  def setup
    @suica = Suica.new
    user_age = 12
    user_gender = "女性"
    user_money = 500
    @machine = Vending_Machine.new(user_money: user_money, user_age: user_age, user_gender: user_gender)
  end

  def test_entry_user
    assert_equal 12, @machine.user_age
    assert_equal "女性", @machine.user_gender
    assert_equal 500, @machine.user_money
    refute_equal 20, @machine.user_age
    refute_equal "男性", @machine.user_gender
    refute_equal 1000, @machine.user_money
  end

  def test_suica_money
    assert_equal 1000, @suica.chage_money(money: 1000)
    assert_equal 1000, @suica.have_money
    refute_equal 500, @suica.have_money
  end

  
end
