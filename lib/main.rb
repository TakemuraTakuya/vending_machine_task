require "pry"
require_relative "suica"
require_relative "drink"
require_relative "vending_machine"

suica = Suica.new
puts "suicaが未登録です"
puts "ユーザー登録をしましょう。"
puts "年齢を入力してください"

age= gets.to_i

#入力された年齢が条件に合うかどうかのif文
if age >= 12 && age <= 100
  user_age = age
else
  until age >= 12 && age <= 100
    puts "注意: 年齢は12歳以上でないと登録できません"
    puts "もう一度入力してください"

    age = gets.to_i

    if age >= 12 && age <= 100
      user_age = age
    end
  end
end

#性別を選んでもらうif文
puts "次に性別を１か２で選択してください"
gender_list = ["男性","女性"]
gender_list.each.with_index(1){|n, i|
  puts "#{i}. #{n}"
}
select_gender = {1 => "男性", 2 => "女性"}

choice = gets.to_i
if choice <= 2
  user_gender = select_gender[choice]
else
  until choice <= 2
    puts "注意: 性別は「１」か「２」の半角数字で入力してください"

    choice = gets.to_i

    if choice <= 2
      user_gender = select_gender[choice]
    end
  end
end

puts "#{user_age}歳 #{user_gender} で登録が完了しました"

puts "suicaのチャージ残高は#{suica.have_money}円です"
puts "100円以上の金額をチャージしてください"

money = gets.to_i

#チャージ金額が１００円以上かどうかのif文
if money >= 100 
  suica.chage_money(money: money)
  puts " #{suica.have_money}円をチャージしました"

else
  until money <= 100
    puts "注意:100円以上の金額をチャージしてください"

    money = gets.to_i
    if money >= 100
      suica.chage_money(money: money)
      puts "#{suica.have_money}円をチャージしました"
    end
  end
end

user_money = suica.have_money

machine = Vending_Machine.new(user_money: user_money, user_age: user_age, user_gender: user_gender)

#購入できる商品のメニュー画面を表示
machine.display

#購入処理
choice = gets.to_i
machine.purchase(choice: choice)

#ジュースを追加する
machine.add_drink_display
choice = gets.to_i
machine.add_drink(choice: choice)

#もう一度購入処理
machine.display
choice = gets.to_i
machine.purchase(choice: choice)

#売上の管理
pp machine.sale_log

