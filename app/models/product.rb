class Product < ApplicationRecord
  belongs_to :brand
  def self.ransackable_attributes(auth_object = nil)
    %w[active amount brand_id created_at id name updated_at]
  end
end
