class Comment < ActiveRecord::Base
  include PublicActivity::Model
  tracked
  apply_simple_captcha
  belongs_to :user
  belongs_to :commentable, :polymorphic => true # belongs_to :post
  has_many :comments, :as => :commentable, dependent: :destroy
  validates :name, presence: true, length: { minimum: 3, maximum: 55 }
  validates :body, presence: true, length: { minimum: 6, maximum: 2000 }
  
  def post
    return @post if defined?(@post)
    @post = commentable.is_a?(Post) ? commentable : commentable.post
  end
  
  def content
    MarkdownService.new.render(body).html_safe
  end

end
