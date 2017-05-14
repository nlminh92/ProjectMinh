class Card < ApplicationRecord
  belongs_to :brand
  belongs_to :retailler
  has_many :orders, :dependent => :destroy
end
