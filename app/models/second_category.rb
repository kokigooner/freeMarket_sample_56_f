class SecondCategory < ApplicationRecord
  belongs_to :first_category
  has_many :third_categories
end
