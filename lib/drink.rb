class Drink
  attr_accessor :name

  DRINK_LIST = {"コーラ" => 120,"水" => 100,"レッドブル" => 210}.freeze

  def initialize(name)
    @name = name
    @price = DRINK_LIST[name]
  end

  def how_money(drink_name)
    DRINK_LIST.keys.include?(name) ? DRINK_LIST[name] : "未登録の商品です"
  end
end

# drink_list = []

# for num in 1..5 do
#   drink = Drink.new("コーラ") 
#   drink_list << drink
# end 

# drink_list

# drink_name = "コーラ"

# for num in 1..5 do
#   drink = Drink.new("水")
#   drink_list << drink
# end

# drink_list 

# pp drink_list.select{|n| n.name == drink_name }.count
# pp drink_list.delete_at(drink_list.map(&:name).find_index(drink_name))


