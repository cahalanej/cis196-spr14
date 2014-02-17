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
  end

  def edit
  end
end
