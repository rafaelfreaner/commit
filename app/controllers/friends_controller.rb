class FriendsController < ApplicationController
  before_filter :require_login, :except => [:index, :show]

  def index
    @user = User.find_by(username: params[:user_id])
  end

  def show
    redirect_to user_path
  end

  def new
    @friendship1 = Friendship.new
    @friendship2 = Friendship.new
  end

  def create
    @user = User.find(current_user)
    @friend = User.find(params[:friend_id])
    @event = Event.find(params[:event_id])
    @friendship1 = Friendship.create({ user_id: @user.id, friend_id: @friend.id, event_id: @event.id, status: 'requested'})
    @friendship2 = Friendship.create({ user_id: @friend.id, friend_id: @user.id, event_id: @event.id, status: 'pending' })
    if @friendship1.save && @friendship2.save
      redirect_to user_friends_path(current_user)
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(current_user)
    @friend = User.find_by(username: params[:id])
    @event = Event.find_by(params[:event_id])
    @friendship1 = Friendship.find_by( user_id: @user.id, friend_id: @friend.id, event_id: @event.id)
    @friendship2 = Friendship.find_by( user_id: @friend.id, friend_id: @user.id, event_id: @event.id)
    if @friendship1.update_attributes({ user_id: @user.id, friend_id: @friend.id, event_id: @event.id, status: 'accepted'}) && @friendship2.update_attributes({ user_id: @friend.id, friend_id: @user.id, event_id: @event.id, status: 'accepted'})
      flash[:notice] = 'Friend successfully created!'
      redirect_to user_path(current_user)
    else
      redirect_to user_path(current_user)
    end
  end

end