class Connection < ApplicationRecord
  belongs_to :brand_follow, :class_name => 'Brand'
  belongs_to :brand_following, :class_name => 'Brand'
end
