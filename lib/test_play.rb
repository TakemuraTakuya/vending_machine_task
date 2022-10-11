def create_suica(year,gender)
  year.include? ? @year = year : print "年齢と性別の登録をしてください。"
  suica_user = [ year, gender]
end

create_suica(5,"男性")
