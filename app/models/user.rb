class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  acts_as_voter
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_many :notifications, dependent: :destroy

  accepts_nested_attributes_for :profile

  class << self
    def from_omniauth auth
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.build_profile name: auth.info.name unless user.profile.present?
        # user.password = Devise
        #   .friendly_token[Settings.friendly_token_low, Settings.friendly_token_high]
        user.password = "123456"
      end
    end
  end
end
