require 'pry'
require_relative 'user'
require_relative 'entry_rules'

class Suica 
  attr_reader :have_money ,:user_age ,:user_gender
  include EntryRules

  def initialize
    @have_money = 0
  end

  def chage_money(money:)

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

  def entry_user(age:)
    #suicaの利用は公式では１２歳からなので12歳以上１００歳までを条件指定。
    if age >= 12 && age <= 100
      rules(age)
    else
      until age >=12 && age <= 100
        puts "注意:年齢は12歳以上でないと登録できません"
        puts "もう一度入力してください。"

        age = gets.to_i

        rules(age)
      end
    end
  end
end

