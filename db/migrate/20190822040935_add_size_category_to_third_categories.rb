class AddSizeCategoryToThirdCategories < ActiveRecord::Migration[5.0]
  def change
    add_reference :third_categories, :size_category, foreign_key: true
  end
end
