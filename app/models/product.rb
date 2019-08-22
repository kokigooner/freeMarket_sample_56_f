class Product < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :user
  belongs_to :first_category
  belongs_to :second_category
  belongs_to :third_category

  has_many :likes, dependent: :destroy
  def like_user(id)

    likes.find_by(user_id: id)
  end
end
