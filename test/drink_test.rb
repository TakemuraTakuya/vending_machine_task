require "minitest/autorun"
require_relative "../lib/drink"

class DrinkTest< Minitest::Test
  def setup
    @drink = Drink.new("coke", 120)
  end

  def test_drink_name
    assert_equal "coke", @drink.name
  end

  def test_drink_price
    assert_equal 120, @drink.price
  end

  def test_false_drink_name
    refute_equal "water", @drink.name
  end

  def test_false_drink_price
    refute_equal 100, @drink.price
  end
end
