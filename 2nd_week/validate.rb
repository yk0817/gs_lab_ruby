require './common'

# 1.ロールバックが起こる。(重複データ)
@headline = Headline.create(title: 'test')
p @headline.errors

# 2.カスタムバリデート
@headline = Headline.create(title: 'validate_test')
# ActiveModelのインスタンス errorsに返ってくる。
p @headline.errors

# 3.6文字超えた場合
@headline = Headline.create(title: '今日は長い授業ですねーー。')
p @headline.errors

# 4.条件付きメソッド
# @headline = Headline.create(title: '20文字以上のつぶやきをするとどうなるんだあああああああーー。')
# p @headline.errors
