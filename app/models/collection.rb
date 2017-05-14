class Collection < ApplicationRecord
  belongs_to :brand
  belongs_to :retailler
  has_many :products

  mount_uploader :image, ImageUploader

def self.search(search)
  where("status LIKE ?", "%#{search}%")
end

end
