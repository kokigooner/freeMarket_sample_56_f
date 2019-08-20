class AddColumnsToProducts < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :first_category, foreign_key: true
    add_reference :products, :second_category, foreign_key: true
    add_reference :products, :third_category, foreign_key: true
    add_reference :products, :brand, foreign_key: true
    add_reference :products, :size, foreign_key: true
  end
end
