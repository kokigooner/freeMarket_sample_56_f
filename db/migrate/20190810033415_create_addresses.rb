class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :postal_code, null: false
      t.string :minicipality, null: false
      t.string :address, null: false
      t.string :building
    end
  end
end
