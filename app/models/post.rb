class Post < ApplicationRecord
  acts_as_votable
  acts_as_taggable
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :notifications, as: :notificationable

  validates :content, presence: true
  validates :title, presence: true
end
