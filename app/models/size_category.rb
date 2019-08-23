class SizeCategory < ApplicationRecord
  has_many  :third_categories
  has_many  :sizes
end
