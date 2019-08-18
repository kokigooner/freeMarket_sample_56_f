class Product < ApplicationRecord
  has_many :images,dependent: :destroy
  belongs_to :user
  belongs_to :first_category
end

