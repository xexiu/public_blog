class Post < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  has_many :comments, :as => :commentable, dependent: :destroy
  validates :categories, presence: true, :inclusion => { :in => ['The Void', 'HTML + CSS','Javascript','Ruby'] }
  validates :featured_post, presence: true, :inclusion => { :in => ['yes', 'no'] }
  validates :user_id, presence: true
  validates :title, presence: true, length: { minimum: 5, maximum: 110 }
  validates :body, presence: true, length: { minimum: 10 }
  if Rails.env.production?
    scope :featured, -> { where(featured_post: 'yes').order(created_at: :desc) } #pg
  else
    scope :featured, -> { where(featured_post: 'yes').order(created_at: :desc) } #sqlite
    scope :unfeatured, -> { where(featured_post: 'no').order(created_at: :desc) } #sqlite
  end
  
  def self.search(query)
    if Rails.env.production?
      where("CAST(title as text) ilike ? OR CAST(id AS text) ilike ?", "%#{query}%", "%#{query}%") # postgres
    else
      where("title like ? OR id like ?", "%#{query}%", "%#{query}%") # sqlite
    end
  end
  
  def content
    MarkdownService.new.render(body).html_safe
  end
  
end
