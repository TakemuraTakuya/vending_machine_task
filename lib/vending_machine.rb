require_relative "drink"

class Vending_Machine
  attr_accessor :sale, :stock

  def initialize
    @sale = 0 
    @stock = []
    
    for num in 1..5
      drinks = Drink.new("コーラ",120)
      @stock << drinks
    end

  end

  def display
    puts "購入したい商品のナンバーを入力してください"
    name_list = ["コーラ", "水", "レッドブル"]
    name_list.each.with_index(1){|n, i| 
    puts "#{i}. #{n}"
  }
  end

  def purchase(money:)
    choice = gets.to_i

    price_list  = {1 => 120, 2 => 100, 3 => 200}
    drink_list = {1 => "コーラ", 2 => "水", 3 => "レッドブル"}

    if choice < 3
      if price_list[choice] <= money && @stock.count{|n|n.name == drink_list[choice]} > 0
        # @sale += price_list[choice]
        # money -= price_list[choice]
        puts "処理中"
      else
        puts "在庫がありません"
      end
    else
      puts "購入できません"
    end
  end
  
  def add_drink

  end
  
  def sale_log
    
  end
end

