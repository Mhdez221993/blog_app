class UsersController < ApplicationController
  def index
    @users = User.all.order('created_at DESC')
    render json: @users
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.recent_posts
    render json: @user
  end
end
