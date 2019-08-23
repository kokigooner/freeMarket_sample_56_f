class Product < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :user
  belongs_to :first_category
  belongs_to :second_category
  belongs_to :third_category
  belongs_to :brand, optional: true
  belongs_to :size, optional: true
end