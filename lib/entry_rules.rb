#userの登録する処理が重複していたのでmodule化
module EntryRules
  def rules(age)
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

      puts "#{user.age}歳 #{user.gender} で登録が完了しました"
    else
      until choice <= 2
        puts "注意:性別は「１」または「２」で半角数字で入力してください"
        choice = gets.to_i
        
        if choice <= 2
          user = User.new(age,select_gender[choice])
          @user_age = user.age
          @user_gender = user.gender

          puts "#{user.age}歳 #{user.gender} で登録が完了しました"
        end
      end
    end
  end
end
