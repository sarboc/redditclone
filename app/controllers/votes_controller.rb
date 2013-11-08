class VotesController < ApplicationController
  before_filter :authenticate_user!

  def index

    votes = []
    posts = Post.all
    comments = Comment.all

    posts.each do |post|
      votes << {type: "post", id: post.id, votes: post.vote_count}
    end

    comments.each do |comment|
      votes << {type: "comment", id: comment.id, votes: comment.vote_count}
    end

    respond_to do |format|
      format.json {render json: votes}
    end
  end

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
