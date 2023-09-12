class Country < ApplicationRecord
    has_many :merchant
    has_many :brand
end
