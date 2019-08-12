class CreateThridCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :thrid_categories do |t|
      t.string :third_category,null: false
      t.references :second_category, foreign_key: true
    end
  end
end
