require_relative "../lib/suica"
require_relative "../lib/drink"
require_relative "../lib/stock"

class VendingMachine 

  def initialize
    @drinks = Array.new(5,Drink.new("コーラ"))
    @sales = 0
    @have_money = 0
  end

  def buy_operation(drink_name)
    if  @drinks.map(&:name).include?(drink_name) && @have_money >= Drink.price_of_drink(drink_name)
      @drinks.delete_at(@drinks.map(&:name).find_index(drink_name))
      @sales += Drink.price_of_drink(drink_name)
      @have_money -= Drink.price_of_drink(drink_name)

      puts "チャージ残高:#}"
    end


  end
end

test = VendingMachine.new
test.buy_operation("コーラ")
