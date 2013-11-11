class Vote < ActiveRecord::Base
  attr_accessible :vote

  belongs_to :votable, polymorphic: true
  belongs_to :user

  validates :vote, presence: true
  validates_uniqueness_of :user_id, scope: [:votable_id, :votable_type]

  # validate do |vote|
  #   if vote.user.votes.where(votable_id: vote.votable_id).any?
  #     vote.errors.add(:user_id, "Must be unique")
  #   end
  # end

  after_save :q_background #:count_votes
  after_destroy :count_votes

  def q_background
    VoteCount.perform_async(self.id)
  end

  def count_votes
    model = self.votable
    count = model.votes.count
    model.update_attributes(vote_count: count)
  end

end
