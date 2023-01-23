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

  def test_drink_stock
    assert_equal 5, @machine.stock.count{|n| n.name == "コーラ"}
    refute_equal 10, @machine.stock.count{|n| n.name == "コーラ"}
  end

  def test_sales
    assert_equal 0, @machine.sale
    refute_equal nil, @machine.sale
    assert_empty @machine.sale_log
  end

  def test_display
    assert @machine.display
    refute_equal nil, @machine.display
  end

  def test_machine_purchase
    assert_nil @machine.purchase(choice: 1)
    assert_equal 880, @machine.user_money
    assert_equal 120, @machine.sale
    assert_equal 4, @machine.stock.count{|n| n.name == "コーラ"}
    assert @machine.sale_log[0]
    refute @machine.sale_log[1]
  end

  def test_add_drink_display
    assert_equal ["水", "レッドブル"], @machine.add_drink_display
    refute_equal ["コーラ", "水"], @machine.add_drink_display
  end

  def test_add_drink_display
    assert_equal 1..5, @machine.add_drink(choice: 1)
    assert_equal 5, @machine.stock.count{|n| n.name == "水"}
    assert_equal 1..5, @machine.add_drink(choice: 2)
    assert_equal 5, @machine.stock.count{|n| n.name == "レッドブル"}
    refute_equal 1..10, @machine.add_drink(choice: 1)
  end
end
