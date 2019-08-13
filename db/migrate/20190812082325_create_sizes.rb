class CreateSizes < ActiveRecord::Migration[5.0]
  def change
    create_table :sizes do |t|
      t.references :size_category, foreign_key: true
      t.string       :size,null:false

    end
  end
end
