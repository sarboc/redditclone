class Vote < ActiveRecord::Base
  attr_accessible :vote

  belongs_to :votable, polymorphic: true
  belongs_to :user

  validates :vote, presence: true

  after_save :count_votes

  private

  def count_votes
    model = self.votable
    count = model.votes.count
    model.update_attributes(vote_count: count)
  end

end
