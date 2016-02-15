class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.username = current_user.username
    post.user_id = current_user.id
    post.save
    redirect_to '/'
  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end

end
