class Card < ApplicationRecord
  belongs_to :product
  validates :status, inclusion: { in: ['available', 'issued'] }
end
