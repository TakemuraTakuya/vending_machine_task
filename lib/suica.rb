class Suica
  MONEY = [10, 50, 100 , 500, 1000].freeze

  def initialize
    @have_money = 0
  end
  def suica_charge(money)
    MONEY.include?(money) ? (@have_money += money ;"#{money}円をチャージしました。") : ("#{money}円はチャージできませんでした。")
  end

  def show_money
    "残金：#{@have_money}円"
  end
end
