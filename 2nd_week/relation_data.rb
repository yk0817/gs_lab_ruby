require './common'

# relationの取り出し方
# p SchoolBlog.find(1).headlines.first

# includes
# D, [2018-08-05T18:43:49.132484 #98550] DEBUG -- :   SchoolBlog Load (0.4ms)  SELECT `school_blogs`.* FROM `school_blogs`
# D, [2018-08-05T18:43:49.147684 #98550] DEBUG -- :   Headline Load (0.4ms)  SELECT `headlines`.* FROM `headlines` WHERE `headlines`.`school_blog_id` = 1

# headlines = SchoolBlog.includes(:headlines)
# headlines.each do |text|
#   text.headlines
# end

# joins
# SchoolBlog Load (0.4ms)  SELECT  `school_blogs`.* FROM `school_blogs` INNER JOIN `headlines` ON `headlines`.`school_blog_id` = `school_blogs`.`id` WHERE `school_blogs`.`id` = 1 LIMIT 11
# SchoolBlog.where(id: 1).joins(:headlines)

# p Headline.first.article

# p SchoolBlog.first.headlines.first.article

# relationでdependent => :destroyとしたリレーションは全て消える
# SchoolBlog.first.destroy
