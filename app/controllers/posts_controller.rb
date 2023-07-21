class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end
  def show
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @post = @user.posts.find(params[:id])
    else
      @post = Post.find(params[:id])
    end
    @comments = @post.comments
  end
end