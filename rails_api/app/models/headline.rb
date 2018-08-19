class Headline < ApplicationRecord
  belongs_to :school_blog
  has_one :article, :dependent => :destroy

  validates :title, uniqueness: true
  validates :title, length: { maximum: 6 }
  validate  :custom_validate

  def custom_validate
    if title.match(/validate_test/)
      errors.add(:title, "validate_error")
    end
  end
end
