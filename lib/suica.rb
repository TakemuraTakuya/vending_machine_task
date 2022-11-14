modlue SuicaModule

  def suica_charge(money)
    money >= 100 ? (@have_money += money; "#{money}円をチャージしました") : "#{money}円はチャージできません"
  end

  def show_money
    "残金：#{@have_money}円"
  end
end
