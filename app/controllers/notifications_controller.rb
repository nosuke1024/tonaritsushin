class NotificationsController < ApplicationController
  def index
    @notifications = current_user.passive_notifications.order(created_at: :desc).page(params[:page]).per(20)
    @notifications.where(checked: false).update_all(checked: true)
  end
end
