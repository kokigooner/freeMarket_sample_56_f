class CreateSizeCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :size_categories do |t|
      t.string       :size_category,null:false     

    end
  end
end
