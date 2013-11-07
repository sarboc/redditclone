class Post < ActiveRecord::Base
  attr_accessible :title, :description, :url

  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :url, presence: true
  validates :user_id, presence: true

end
