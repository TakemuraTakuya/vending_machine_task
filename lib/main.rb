require "pry"
require_relative "suica"
require_relative "drink"
require_relative "vending_machine"

suica = Suica.new

suica.chage_money
money = suica.have_money

machine = Vending_Machine.new(money: money)

#購入できる商品のメニュー画面を表示
machine.display

#購入処理をする
machine.purchase

#ジュースを追加する
machine.add_drink

#もう一度購入処理
machine.display
machine.purchase

#売上の管理
machine.sale_log

