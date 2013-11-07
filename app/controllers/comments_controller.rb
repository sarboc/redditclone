class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
  end

  def new
    @post = Post.find(params[:post_id])
  end

  def create
    @model = Post.find(params[:post_id])

    @comment = @model.comments.new(params[:comment])
    @comment.user = current_user
    @comment.save

    redirect_to post_comments_path
  end

  def show
  end

end
