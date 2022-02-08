class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @pagy, @posts = pagy(@user.posts, items: 2)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to user_post_path(@post.user.id, @post.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:user_id])
    post = Post.find(params[:id])
    if post.destroy!
      flash[:notice] = 'Post was successfully destroyed'
      redirect_to user_posts_path(user)
    else
      redirect_to user_post_path(user, post)
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
