require 'pry'

class Suica 
  attr_reader :have_money

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
    
  end
end

