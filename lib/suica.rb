require 'pry'
require_relative 'user'

class Suica 
  attr_reader :have_money ,:suica_entry ,:user_age ,:user_gender

  def initialize
    @have_money = 0
    @suica_entry = []
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

  def entry_user
    puts "suicaが未登録です"
    puts "ユーザー登録をしましょう。"

    puts "年齢を入力してください"
    age= gets.to_i

    #suicaの利用は公式では１２歳からなので12歳以上１００歳までを条件指定。
    if age >= 12 && age <= 100
      puts "次に性別を１か２で選択してください"

      gender_list = ["男性","女性"]
      gender_list.each.with_index(1){|n, i|
        puts "#{i}. #{n}"
      }
      select_gender = {1 => "男性", 2 => "女性"}

      choice= gets.to_i

      if choice <= 2
        user = User.new(age,select_gender[choice])
        @user_age = user.age
        @user_gender = user.gender
        @suica_entry << user

        puts "#{user.age}歳 #{user.gender} で登録が完了しました"
      else
        until choice <= 2
          puts "注意:性別は「１」または「２」で半角数字で入力してください"
          choice = gets.to_i
          
          if choice <= 2
            user = User.new(age,select_gender[choice])
            @user_age = user.age
            @user_gender = user.gender
            @suica_entry << user
    
            puts "#{user.age}歳 #{user.gender} で登録が完了しました"
          end
        end
      end
    else
      until age >=12 && age <= 100
        puts "注意:年齢は12歳以上でないと登録できません"
        puts "もう一度入力してください。"

        age = gets.to_i

        if age >= 12 && age <= 100
          puts "次に性別を１か２で選択してください"
    
          gender_list = ["男性","女性"]
          gender_list.each.with_index(1){|n, i|
          puts "#{i}. #{n}"
          }

          select_gender = {1 => "男性", 2 => "女性"}
          choice= gets.to_i
          
          if choice <= 2
            user = User.new(age,select_gender[choice])
            @user_age = user.age
            @user_gender = user.gender
            @suica_entry << user
    
            puts "#{user.age}歳 #{user.gender} で登録が完了しました"
          else
            until choice <= 2
              puts "注意:性別は「１」または「２」で半角数字で入力してください"
              choice = gets.to_i
              
              if choice <= 2
                user = User.new(age,select_gender[choice])
                @user_age = user.age
                @user_gender = user.gender
                @suica_entry << user
        
                puts "#{user.age}歳 #{user.gender} で登録が完了しました"
              end
            end
          end
        end
      end
    end


  end
end

