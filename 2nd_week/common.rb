require 'nokogiri'
require 'active_record'
require 'open-uri'
require 'date'
require 'active_support'
require 'active_support/core_ext'

# 標準出力ログを出す
ActiveRecord::Base.logger = Logger.new(STDOUT)

# active_recordを継承する。
class SchoolBlog < ActiveRecord::Base
  has_many :headlines, :dependent => :destroy
end

class Headline < ActiveRecord::Base
  belongs_to :school_blog
  has_one :article, :dependent => :destroy
  # 以下、バリデーションエラー
  validates :title, uniqueness: true
  validates :title, length: { maximum: 6 }
  validate  :custom_validate

  def custom_validate
    if title.match(/validate_test/)
      errors.add(:title, "validate_error")
    end
  end

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
