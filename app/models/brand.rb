class Brand < ApplicationRecord
  has_many :brand_categories 
  has_many :first_categories, through: :brand_categories 
end
