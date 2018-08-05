require 'nokogiri'
require 'active_record'
require 'open-uri'
require 'pp'

# # 標準出力ログを出す
ActiveRecord::Base.logger = Logger.new(STDOUT)
#
# # active_recordを継承する。
class SchoolBlog < ActiveRecord::Base
  has_many :headlines, :dependent => :destroy
end

class Headline < ActiveRecord::Base
  belongs_to :school_blog
  has_one :article, :dependent => :destroy
end
class Article < ActiveRecord::Base
  belongs_to :headline
end

ActiveRecord::Base.establish_connection(
  adapter:  "mysql2",  #アダプター名
  host:     "localhost",  #ホスト名
  username: "root",  #ユーザー名
  password: "",  #パスワード
  database: "ruby_study",  #データベース名
)

# p Nokogiri.class
