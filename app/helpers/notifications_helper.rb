module NotificationsHelper
  def noti notification
    post = notification.notificationable
    notification.notified_by.profile.name + t("has-" + notification
      .notice_type) + post.title
  end

  def number
    user_signed_in? ? current_user.notifications.uncheck.count : 0
  end
end
