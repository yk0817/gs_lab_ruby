class Headline < ApplicationRecord
  belongs_to :school_blog
  has_one :article, :dependent => :destroy
end
