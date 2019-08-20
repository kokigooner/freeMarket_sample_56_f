class ThirdCategory < ApplicationRecord
  has_many   :products
  belongs_to :second_category
end
