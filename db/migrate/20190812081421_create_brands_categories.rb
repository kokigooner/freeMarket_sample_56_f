class CreateBrandsCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :brands_categories do |t|
      t.references :first_category, foreign_key: true
      t.references :brand, foreign_key: true
    end
  end
end
