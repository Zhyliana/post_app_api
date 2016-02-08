class Api::CommentsController < Api::ApiController
  def index
    @comments = Comment.find(params[:post_id]).comments
    render :index
  end

  def show
    @comment = Comment.find(params[:id])
    render partial: 'api/comments/comment', locals: { comment: @comment }
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      render partial: 'api/comments/comment', locals: { comment: @comment }
    else
      render json: { errors: @comment.errors.full_messages }, status: 422
    end
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.author == current_user && @comment.save
      render partial: 'api/comments/comment', locals: { comment: @comment }
    else
      render json: { errors: @comment.errors.full_messages }, status: 422
    end
  end

  def destroy
    @comment =  Comment.find(params[:id])

    if @comment.author == current_user && @comment.destroy
      render json: { sucess: 'Comment destroyed.' }
    else
      render json: { errors: @comment.errors.full_messages }, status: 422
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :parent_comment_id)
  end
end

