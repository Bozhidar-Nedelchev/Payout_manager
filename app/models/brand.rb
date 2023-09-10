class Brand < ApplicationRecord
  belongs_to :merchant
  has_many :products
end
