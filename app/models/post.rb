class Post < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :categories, presence: true, :inclusion => { :in => ['The Void', 'HTML + CSS','Javascript','Ruby'] }
  validates :user_id, presence: true
  validates :title, presence: true, length: { minimum: 5, maximum: 110 }
  validates :body, presence: true, length: { minimum: 10 }
end
