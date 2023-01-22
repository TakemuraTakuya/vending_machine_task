require "minitest/autorun"
require_relative "../lib/vending_machine"

class MachineTest < Minitest::Test
  def setup
    user_money = 1000
    user_age = 20
    user_gender = "男性"
    @machine = Vending_Machine.new(user_money: user_money, user_age: user_age, user_gender: user_gender)
  end

  def test_drink_stock
    assert_equal 5, @machine.stock.count
  end

  def test_user
    assert_equal 20, @machine.user_age
    assert_equal "男性",@machine.user_gender
    assert_equal 1000,@machine.user_money
    refute_equal 2, @machine.user_age
    refute_equal "女性", @machine.user_gender
    refute_equal 100, @machine.user_money
  end

  def test_display
    
  end
end
