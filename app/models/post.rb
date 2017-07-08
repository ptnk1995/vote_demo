class Post < ApplicationRecord
  acts_as_votable
  acts_as_taggable
  belongs_to :user

  has_many :comments, dependent: :destroy

  validates :content, presence: true
  validates :title, presence: true
end
