class SecondCategory < ApplicationRecord
  has_many   :products
  has_many   :third_categories
  belongs_to :first_category
end
