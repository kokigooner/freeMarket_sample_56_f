class CreateProductions < ActiveRecord::Migration[5.0]
  def change
    create_table :productions do |t|
      t.references :user, foreign_key: true
      t.string :product_name, null: false
      t.integer :price, null: false
      t.text :description, null: false
      t.string :condition, null: false
      t.string :delivery_charge, null: false
      t.string :delivery_date, null: false
      t.string :delivery_way, null: false
      t.string :order_status
    end
  end
end
