class VoteCount
  include Sidekiq::Worker

  def perform(id)
    vote = Vote.find(id)
    vote.count_votes
  end
end