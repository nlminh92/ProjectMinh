class Brand < ApplicationRecord
	belongs_to :user
	has_many :product
	has_many :collection
end
