require_relative "../lib/drink"

class Stock

  def initialize
    @drinks = Array.new(5,Drink.new("コーラ"))
  end

  def purchace(drink_name)
    
  end
end

test = Stock.new
test.purchace("コーラ")
