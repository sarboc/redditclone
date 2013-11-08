class VotesController < ApplicationController
  before_filter :authenticate_user!

  def create
    comment = Comment.find(params[:id])
    vote = comment.votes.new(vote: 1)
    vote.user = current_user
    vote.save

    respond_to do |format|
      format.json {render json: comment, include: :votes}
    end
  end
end
