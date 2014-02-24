class CommentsController < ApplicationController
  def new
  	@comment = Comment.new
  end

  def create
  	@comment = Comment.new(comment_params)
  	if @comment.save
  		redirect_to comments_path
  	else
  		render 'new'
  	end
  end

  def comment_params
  	params.require(:comment).permit(:body, :user_id, :post_id)
  end

  def index
  	@comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      redirect_to comment_path(@comment.id)
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_path
  end
end
