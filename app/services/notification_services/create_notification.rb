class NotificationServices::CreateNotification
  def initialize params
    @comment = params[:comment]
    @current_user_id = params[:current_user_id]
  end

  def create_notification
    return if @comment.post.user_id == @current_user_id
    @comment.post.notifications.create! user_id:  @comment.post.user_id,
      notified_by_id: @comment.user_id, notice_type: "Comment"
  end
end
