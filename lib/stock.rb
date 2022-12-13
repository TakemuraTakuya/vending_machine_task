require_relative "drink"

class Stock

  def initialize(name)
    @drink_stock = []
    for num in 1..5 do 
      drinks = Drink.new("coke")
      @drink_stock << drikns
    end
  end

end
