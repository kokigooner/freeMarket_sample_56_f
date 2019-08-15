class AddFirstCategoryToProducts < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :first_category, foreign_key: true
  end
end
