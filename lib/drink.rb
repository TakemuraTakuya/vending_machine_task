
class Drink
  DRINK_LIST = {"coke" => 120, "water" => 100, "redbule" => 210}

  def initialize(name)
    @name = name
    @price = DRINK_LIST[name]
  end

  def self.how_many(drink_name)
      DRINK_LIST[drink_name] ? DRINK_LIST[name] : puts "その商品は登録されていません"
  end
end
