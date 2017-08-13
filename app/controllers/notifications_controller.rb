class NotificationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_notification, only: :show

  def index
    current_user.notifications.map(&:checked!)
  end

  def show
    @notification.read!
    post = @notification.notificationable
    redirect_to post
  end

  private
  def find_notification
    @notification = Notification.find_by id: params[:id]
    redirect_to root_url, notice: t("not_found") unless @notification
  end
end
