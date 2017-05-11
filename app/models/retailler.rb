class Retailler < ApplicationRecord
  has_one :user
  mount_uploader :logo, ImageUploader
  has_many :connections
  has_many :collections
end
