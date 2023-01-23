require_relative "drink"

class Vending_Machine
  attr_reader :sale, :stock ,:sale_log, :user_money, :user_age, :user_gender

  def initialize(user_money:, user_age: ,user_gender:)
    @user_money = user_money
    @user_age = user_age
    @user_gender = user_gender
    @sale = 0
    @stock = []
    @sale_log = []

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

  def purchase(choice:)

    price_list  = {1 => 120, 2 => 100, 3 => 200}
    drink_list = {1 => "コーラ", 2 => "水", 3 => "レッドブル"}

    if choice <= 3
      if price_list[choice] <= @user_money && @stock.count{|n|n.name == drink_list[choice]} > 0
        @sale += price_list[choice]
        @user_money -= price_list[choice]

        #購入されたタイミングで日時とsuicaの登録ユーザーの年齢と性別を空の配列の中に保存する
        time = Time.now
        sale_date = [time, drink_list[choice],@user_age, @user_gender]
        @sale_log << sale_date

        #find_indexで該当するdrinkの最初の位置を出し、それをdelete_atに渡して在庫を減らす。
        @stock.delete_at(@stock.find_index{|n| n.name == drink_list[choice]})

        puts "#{drink_list[choice]}を１本購入しました！"
        puts "suicaのチャージ残高は#{@user_money}円です"

      else
        puts "在庫がありません"
      end
    else
      #1..3以外の数字では購入処理できない
      puts "購入できません"
    end
  end
  
  def add_drink_display
    puts "商品を追加できます。"
    puts "追加したい商品を選択してください"

    add_list = ["水", "レッドブル"]
    add_list.each.with_index(1){|n, i|
      puts "#{i}. #{n}"
    }
  end

  def add_drink(choice:)
    if choice <= 2 
      drink_list = {1 => "水", 2 => "レッドブル"}
      price_list = {1 => 100, 2 => 200}
      for num in 1..5 do
        drinks = Drink.new(drink_list[choice],price_list[choice])
        @stock << drinks
      end
    else
      puts "追加できません"
    end

  end
  
end

