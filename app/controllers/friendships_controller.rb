class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.new(friend_id: params[:id], event_id: params[:event_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to dashboard_path
    else
      flash[:error] = "Unable to add friend."
      redirect_to dashboard_path
    end
  end

end