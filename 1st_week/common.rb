require 'nokogiri'
require 'active_record'
require 'open-uri'
require 'pp'

# # 標準出力ログを出す
ActiveRecord::Base.logger = Logger.new(STDOUT)
#
# # active_recordを継承する。
class Headline < ActiveRecord::Base
end
#
ActiveRecord::Base.establish_connection(
  adapter:  "mysql2",  #アダプター名
  host:     "localhost",  #ホスト名
  username: "root",  #ユーザー名
  password: "",  #パスワード
  database: "ruby_study",  #データベース名
)

# p Nokogiri.class
