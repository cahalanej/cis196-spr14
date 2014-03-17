class CommentsController < ApplicationController
  def new
    if user_signed_in?
     @comment = Comment.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
  	@comment = Comment.new(comment_params)
    if @comment.user_id != current_user.id
      render 'new'
    else
  	   if @comment.save
          Notifications.new_comment(@comment).deliver
  	   	 redirect_to comments_path
  	   else
  		    render 'new'
  	   end
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
    if user_signed_in?
      @comment = Comment.find(params[:id])
    else
      redirect_to new_user_session_path
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.user_id != current_user.id
      render 'new'
    else
      if @comment.update_attributes(comment_params)
        redirect_to comment_path(@comment.id)
      else
        render 'edit'
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_path
  end
end
