class Drink
  attr_reader :name ,:price
  DRINK_LIST = {"コーラ" => 120, "水" => 100, "レッドブル" => 210}.freeze
  
  def initialize(name)
    @name = name
    @price = DRINK_LIST[name]
  end

  def self.price_of_drink(name)
    DRINK_LIST.keys.include?(name) ? DRINK_LIST[name] : "在庫がありません"
  end
end

