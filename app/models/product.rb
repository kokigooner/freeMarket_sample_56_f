class Product < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :user
  belongs_to :first_category
  belongs_to :second_category
  belongs_to :third_category
  belongs_to :brand
  belongs_to :size
  

  has_many :likes, dependent: :destroy
  def likes_user(user_id)
   likes.find_by(user_id: user_id)
  end

end
