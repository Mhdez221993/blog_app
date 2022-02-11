class CommentsController < ApplicationController
  before_action :current_user

  def index
    post = Post.find(params[:post_id])
    @comments = post.comments
    render json: @comments
  end

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(user_id: current_user.id, text: commnet_params[:text])
    if @comment.save
      render json: { message: 'Comment created successfully' }
    else
      render json: { message: 'Unable to create comment' }
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    comment = Comment.find(params[:id])
    comment.destroy

    redirect_to user_post_path(post.user, post)
  end

  # private

  def commnet_params
    params.require(:comment).permit(:text)
  end
end
