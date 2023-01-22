require "pry"
require_relative "suica"
require_relative "drink"
require_relative "vending_machine"

suica = Suica.new
puts "suicaが未登録です"
puts "ユーザー登録をしましょう。"

puts "年齢を入力してください"
age= gets.to_i

suica.entry_user(age: age)

user_age = suica.user_age
user_gender = suica.user_gender

puts "suicaのチャージ残高は#{suica.have_money}円です"
puts "100円以上の金額をチャージしてください"

money = gets.to_i

suica.chage_money(money: money)
user_money = suica.have_money

machine = Vending_Machine.new(user_money: user_money, user_age: user_age, user_gender: user_gender)

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
pp machine.sale_log

