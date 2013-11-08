class PostsController < ApplicationController
  skip_before_filter :authenticate_user!, only: :index

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(params[:post])
    post.user = current_user
    post.save

    redirect_to posts_path
  end

  # def show
  # end

end
