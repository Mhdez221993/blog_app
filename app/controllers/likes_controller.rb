class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    post = Post.find(params[:post_id])
    user = User.find(params[:user_id])
    like = post.likes.new(user_id: user.id)
    like.save
    redirect_to user_post_path(user, post)
  end
end
