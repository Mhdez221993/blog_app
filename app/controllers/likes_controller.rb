class LikesController < ApplicationController
  def create
    post = Post.find(params[:format])
    like = post.likes.new(user_id: current_user.id)

    flash[:alert] = 'Failed to add a like' unless like.save
    redirect_to user_post_path(post.user.id, post.id)
  end
end
