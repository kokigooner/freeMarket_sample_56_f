class BrandsCategory < ApplicationRecord
  belongs_to :brand
  belongs_to :first_category
end
