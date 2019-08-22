class Like < ApplicationRecord
  belongs_to :product, counter_cache: :likes_count
end
