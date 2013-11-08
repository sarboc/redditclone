class CommentsController < ApplicationController
  skip_before_filter :authenticate_user!, only: :index

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
  end

  def create
    if params[:post_id]
      @model = Post.find(params[:post_id])
    else
      @model = Comment.find(params[:comment][:commentable_id])
    end

    params[:comment].delete(:commentable_id)

    @comment = @model.comments.new(params[:comment])
    @comment.user = current_user
    @comment.save

    print "*" * 50
    p @comment.top_level_post
    redirect_to post_comments_path(@comment.top_level_post)
  end


end
