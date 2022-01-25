class PostsController < ApplicationController
  def index
    @post = Post.find_by(user_id: params[:user_id])
  end

  def show; end
end
