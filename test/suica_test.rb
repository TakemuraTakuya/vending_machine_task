require "minitest/autorun"
require_relative "../lib/suica"

class SuicaTest < Minitest::Test

  def setup
    @suica = Suica.new
  end

  def test_have_money
    assert @suica.have_money
  end

  def test_chage_money
    assert_nil @suica.chage_money(money: 1000)
    assert_equal 1000, @suica.have_money
  end

  def test_entry_user
    assert_equal 
  end
end
