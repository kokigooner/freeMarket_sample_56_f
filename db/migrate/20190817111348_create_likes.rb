class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.references :product, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :like

      t.timestamps
    end
  end
end
