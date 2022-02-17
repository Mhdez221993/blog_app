class UsersController < ApplicationController
  def index
    @users = User.all.order('created_at DESC')
  end

  def show
    @user = User.find_by(id: params[:id])
    @pagy, @posts = pagy(@user.posts, items: 3)
  end
end
