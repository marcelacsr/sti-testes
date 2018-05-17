class NotificationsController < ApplicationController
  before_action :logged_in_user

  def index
    @notifications = current_user.received_notifications
                         .order(created_at: :desc)
  end

  def create
    @user = User.find(params[:follower_id])
    current_user.send_follow_notification(@user)
    @user.send_notification_email
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    Notification.find(params[:id]).destroy
    flash[:success] = 'Ignored!'
    redirect_to notifications_url
  end

  def undo
    notification = Notification.find(params[:notification_id])
    @user = notification.followed
    notification.destroy
    flash[:success] = 'Notification undone!'
    redirect_to @user
  end
end
