class RelationshipsController < ApplicationController
  before_action :logged_in_user

  # follow
  def create
    @user = User.find(params[:follower_id])
    notification = Notification.find(params[:notification_id])
    notification.update(notification_read: true)
    current_user.follow(@user)
    flash[:success] = "#{@user.name} is following you!"
    redirect_to notifications_url
  end

  # unfollow
  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      flash[:success] = 'Unfollowed!'
      format.html { redirect_to @user }
      format.js
    end
  end
end
