class Api::PostsController < Api::ApiController
  def index
    @posts = Post.all
    render :index
  end

  def show
    @post = Post.find(params[:id])
    render partial: 'api/posts/post', locals: { post: @post }
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      render partial: 'api/posts/post', locals: { post: @post }
    else
      render json: { errors: @post.errors.full_messages }, status: 422
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.save
      render partial: 'api/posts/post', locals: { post: @post }
    else
      render json: { errors: @post.errors.full_messages }, status: 422
    end
  end

  def destroy
    @post =  Post.find(params[:id])

    if @post.author == current_user && @post.destroy
      render json: { sucess: 'Post destroyed.' }
    else
      render json: { errors: @post.errors.full_messages }, status: 422
    end
  end

  private
  def post_params
    params.require(:post).permit(:id, :title, :url, :content)
  end
end

