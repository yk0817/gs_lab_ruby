class SchoolBlog < ApplicationRecord
  has_many :headlines, :dependent => :destroy
end
