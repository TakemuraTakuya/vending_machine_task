require_relative "../lib/drink"
require_relative "../lib/stock"
require_relative "../lib/suica"

class VendingMachine
  attr_accessor :drinks,:sales,:have_money
  include SuicaModule

  def initialize
    @have_money = 0
    @sales = 0
  
    @drink_list = []
    for num in 1..5 do
      drinks = Drink.new("コーラ")
      @drink_list << drinks
    end
  end

  def buy_drink(drink_name)
    if Drink::DRINK_LIST.keys.includ?(drink_name) && how_money(drink_name) <= @have_money
      @drink_list.delete_at(@drink_list.map(&:name).find_index(drink_name))
      @sales += how_money(drink_name)
      @have_money -= how_money(drink_name)
    else
      "購入できません"
    end
  end
end
