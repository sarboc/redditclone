class Comment < ActiveRecord::Base
  attr_accessible :text, :vote_count

  belongs_to :commentable, polymorphic: true
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy

  validates :text, presence: true
  validates :user_id, presence: true
  validates :commentable, presence: true

  def top_level_post
    comment = self

    until comment.commentable_type == "Post"
      comment = comment.commentable
      puts comment
    end

    comment.commentable

  end

end