class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @pagy, @posts = pagy(@user.posts, items: 3)
    render json: @posts
  end

  def show
    @post = Post.find(params[:id])
    render json: @post
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      render json: { message: 'Post created successfully' }
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy!
      render json: { message: 'Post destroyed successfully' }
    else
      render json: { message: 'Post no found' }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
