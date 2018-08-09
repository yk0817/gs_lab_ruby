require './common'

# 今日の日付
p Date.today

# 明日の日付
p Date.today + 1

# 整形
p Date.today.strftime("%Y-%m-%d")
p (Date.today + 1).strftime("%Y-%m-%d")

# 月初、月末
date = Date.today
p DateTime.new(date.year, date.month, 1).strftime("%Y-%m-%d")
p DateTime.new(date.year, date.month + 1, -1).strftime("%Y-%m-%d")
