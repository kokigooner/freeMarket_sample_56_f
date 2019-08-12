class CreateSecondCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :second_categories do |t|
      t.string :second_category,null: false
      t.references :first_category,foreign_key: true
    end
  end
end
