require_relative "drink"

class Vending_Machine
  attr_accessor :sale, :stock

  def initialize
    @sale = 0 
    @stock = []
    
    for num in 1..5 do
      cokes = Drink.new("コーラ",120)
      @stock << cokes
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

    if choice <= 3
      if price_list[choice] <= money && @stock.count{|n|n.name == drink_list[choice]} > 0
        @sale += price_list[choice]
        money -= price_list[choice]

        #@stockの中からselectで選択したdrinkをひとつ消す => 在庫を減らす。
        @stock.select!{|n| n.name == drink_list[choice]}.shift()

        puts "#{drink_list[choice]}を１本購入しました！"
        puts "suicaのチャージ残高は#{money}円です"

      else
        puts "在庫がありません"
      end
    else
      #1..3以外の数字では購入処理できない
      puts "購入できません"
    end
  end
  
  def add_drink
    puts "商品を追加できます。"
    puts "追加したい商品を選択してください"

    add_list = ["水", "レッドブル"]
    add_list.each.with_index(1){|n, i|
      puts "#{i}. #{n}"
    }
    drink_list = {1 => "水", 2 => "レッドブル"}
    price_list = {1 => 100, 2 => 200}

    choice = gets.to_i

    if choice <= 2
      for num in 1..5 do
        drinks = Drink.new(drink_list[choice],price_list[choice])
        @stock << drinks
      end

      puts "#{drink_list[choice]}を5本追加しました!"

    else
      puts "追加できません"
    end

  end
  
  def sale_log
    
  end
end

