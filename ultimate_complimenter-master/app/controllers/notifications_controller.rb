class NotificationsController < ApplicationController

  def new
    @notification = Notification.new
  end

  def create
    @notification = Notification.new(notification_params)

    
    @notification.text
    redirect_to new_notification_path(@notification)
    
  end

  private
  def notification_params
    params.permit(:to_number)
  end

end

