class FirstCategory < ApplicationRecord
  has_many :brand_categories 
  has_many :brand through: :brand_categories 
end
