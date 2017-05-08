class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :retailler
  belongs_to :collection

  mount_uploader :image, ImageUploader



  def self.search(search)
    where("name_products LIKE ?", "%#{search}%")
    where("code LIKE ?", "%#{search}%")
  end
end
