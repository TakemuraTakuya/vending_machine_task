require 'pry'
require_relative 'user'

class Suica 
  attr_reader :have_money :user_list

  def initialize
    @have_money = 0
  end

  def chage_money
    puts "suicaのチャージ残高は#{@have_money}円です"
    puts "100円以上の金額をチャージしてください"

    money = gets.to_i
    
    if money >= 100
      @have_money += money
      puts "#{@have_money}円チャージしました!"

    else 
      until money >= 100
        puts "注意: 100円以上の金額をチャージしてください!"
        money = gets.to_i
        if money >= 100
          @have_money += money 
          puts "#{@have_money}円チャージしました!"
        end
      end
    end
  end

  def user
    @user_list = []
    puts "suicaが未登録です"
    puts "ユーザー登録をしましょう。"

    puts "年齢を入力してください"
    age_input = gets.to_i
    #suicaの利用は公式では１２歳からなので12歳以上１００歳までを条件指定。
    until age_input >=12 && age_input <= 100
      puts "年齢は12歳以上でないと登録できません"
      puts "もう一度入力してください。"

      age_input = gets.to_i

      if age_input >= 12 && age_input <= 100
        

      end
    end
  end
end

