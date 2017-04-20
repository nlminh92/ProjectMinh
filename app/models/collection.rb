class Collection < ApplicationRecord
  belongs_to :brand_id
  belongs_to :retailler_id
  has_may :product
end
