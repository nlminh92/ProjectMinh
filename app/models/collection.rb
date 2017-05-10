class Collection < ApplicationRecord
  belongs_to :brand_id
  belongs_to :retailler_id
  has_many :product

  mount_uploader :image, ImageUploader
  mount_uploader :lookbook, ImageUploader


def self.search(search)
  where("status LIKE ?", "%#{search}%") 
end

end
