class Retailler < ApplicationRecord
  has_one :user
  mount_uploader :logo, ImageUploader
end
