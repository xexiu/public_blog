class Comment < ActiveRecord::Base
  apply_simple_captcha
  belongs_to :commentable, :polymorphic => true # belongs_to :post
  has_many :comments, :as => :commentable
  validates :name, presence: true, length: { minimum: 3, maximum: 55 }
  validates :body, presence: true, length: { minimum: 6, maximum: 2000 }
  
  def post
    return @post if defined?(@post)
    @post = commentable.is_a?(Post) ? commentable : commentable.post
  end

end
