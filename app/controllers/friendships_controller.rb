class FriendshipsController < ApplicationController
  def new
    @friendship = Friendship.new
  end

  def create
    @friendship = current_user.pending_friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      redirect_to users_path, notice: 'Friend requested'
    else
      redirect_to users_path, notice: @friendship.errors.full_messages
    end
  end

  def destroy
    @friendship = Friendship.find_by(id: params[:id])
    @friendship.destroy
    redirect_to root_path
  end

  # def remove_friendship
  #   @friendship = Friendship.find_by user_id: current_user.id, friend_id: params[:id]
  #   @friendship_reverse = Friendship.find_by friend_id: current_user.id, user_id: params[:id]
  #   @friendship&.destroy
  #   @friendship_reverse&.destroy
  #   redirect_to users_path
  # end

  def confirm
    @friendship = Friendship.find_by(id: params[:id])
    @friendship.update_attribute(:confirmed, true)
    redirect_to root_path
  end
end
