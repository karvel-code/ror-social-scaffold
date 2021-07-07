class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end

  def unconfirmed_requests
    @pending_friendships = current_user.pending_friendships
    @inverted_friendships = current_user.inverted_friendships
  end

  def friends
    @friends = current_user.friends
  end
end
