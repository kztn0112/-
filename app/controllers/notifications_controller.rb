class NotificationsController < ApplicationController
  def index
    @notifications = current_user.passive_notifications.where(checked: false).includes(:visitor, :question).page(params[:page])
    @notifications.each do |notice|
      notice.update_attributes(checked: true)
    end
  end
end
