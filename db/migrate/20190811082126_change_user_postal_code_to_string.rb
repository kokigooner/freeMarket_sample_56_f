class ChangeUserPostalCodeToString < ActiveRecord::Migration[5.0]
  def up
    change_column :addresses, :postal_code, :string, null: false    
  end

  def down
    change_column :addresses, :postal_code, :integer, null: false
  end
end
