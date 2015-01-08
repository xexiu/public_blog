class Post < ActiveRecord::Base
  acts_as_votable
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  belongs_to :user
  has_many :comments, :as => :commentable, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  validates :categories, presence: true, :inclusion => { :in => ['The Void', 'HTML + CSS','Javascript','Ruby'] }
  validates :featured_post, presence: true, :inclusion => { :in => ['yes', 'no'] }
  validates :user_id, presence: true
  validates :title, presence: true, length: { minimum: 5, maximum: 70 }
  validates :body, presence: true, length: { minimum: 10 }
  validates :all_tags, presence: true, length: { minimum: 2, maximum: 15 }, 
  :length => { # Maximum 5 words
  :maximum => 5, # Maximum 5 words
  :tokenizer => lambda { |str| str.scan(/\w+/) },
  :too_long  => "Please limit your summary to %{count} words"
}
  scope :featured, -> { where(featured_post: 'yes').order(created_at: :desc).limit(100) }
  scope :unfeatured, -> { where(featured_post: 'no').order(created_at: :desc).limit(100) }
  
  def slug_candidates
    [
      :title,
      [:title, :id] # Take cares of duplicate titles
    ]
  end
  
  def self.search(query)
    if Rails.env.production?
      where("CAST(title as text) ilike ? OR CAST(id AS text) ilike ? OR CAST(categories AS text) ilike ?", "%#{query}%", "%#{query}%", "%#{query}%") # postgres
    else
      where("title like ? OR id like ? OR categories like ?", "%#{query}%", "%#{query}%", "%#{query}%") # sqlite
    end
  end
  
  def content
    MarkdownService.new.render(body).html_safe
  end
  
  #Getter and Setter for all_tags vertial attribute
  def all_tags=(names)
    self.tags = names.split(" ").map do |name|
        Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(" ")
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).posts
  end
  
end
