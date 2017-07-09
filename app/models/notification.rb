class Notification < ApplicationRecord
  after_create_commit ->{NotificationBroadcastJob.perform_later(self)}

  belongs_to :notified_by, class_name: User.name
  belongs_to :user
  belongs_to :notificationable, polymorphic: true

  enum read: [:unread, :read]
  enum checked: [:uncheck, :checked]

  scope :order_by_created, (->{order created_at: :desc})
end
