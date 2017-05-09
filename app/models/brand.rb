class Brand < ApplicationRecord
  has_one :user
  mount_uploader :logo, ImageUploader
  has_many :follower, :class_name => 'Connection', :foreign_key => 'brand_follow_id'
  has_many :following, :class_name => 'Connection', :foreign_key => 'brand_following_id'
end
