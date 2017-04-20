class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :retailler
  belongs_to :collection

  mount_uploader :image, ImageUploader
end
