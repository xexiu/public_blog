class Comment < ActiveRecord::Base
  apply_simple_captcha
  belongs_to :post
  validates :name, presence: true, length: { minimum: 3, maximum: 55 }
  validates :body, presence: true, length: { minimum: 6, maximum: 2000 }
end
