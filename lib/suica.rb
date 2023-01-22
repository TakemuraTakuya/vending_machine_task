
class Suica 
  attr_reader :have_money 

  def initialize
    @have_money = 0
  end

  def chage_money(money:)
      @have_money += money
  end

end

