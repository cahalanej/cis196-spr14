class PostsController < ApplicationController
  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	if @post.save
  		redirect_to posts_path
  	else
  		render 'new'
  	end
  end

  def post_params
  	params.require(:post).permit(:title, :body, :category, :user_id)
  end

  def index
  	@posts = Post.all
  end

  def show
  end

  def edit
  end
end
