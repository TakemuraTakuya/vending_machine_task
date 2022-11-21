module SuicaModule

  def suica_charge(money)
    money >= 100 ? @have_money + money && "#{money}円をチャージしました" : "#{money}はチャージできませんでした"
  end

  def charged_money
    "チャージ残高: #{@have_money}円"
  end
end
