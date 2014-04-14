class PostsController < ApplicationController
  def new
    if user_signed_in?
  	 @post = Post.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
  	@post = Post.new(post_params)
    if @post.user_id != current_user.id
  	 render 'new'
    else
      if @post.save
  		  redirect_to posts_path
  	 else
  	 	 render 'new'
  	 end
    end
  end

  def post_params
  	params.require(:post).permit(:title, :body, :category, :user_id)
  end

  def cat_index
    @posts = Post.where(category: params[:cat])
    render 'posts/index'
  end

  def index
  	@posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = Comment.where(post_id: params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_path(@post.id)
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
end
