class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.references :user, null: false, foreign_key: true
      t.string :customer, null: false
      t.string :card, null: false
      t.timestamps
    end
  end
end
