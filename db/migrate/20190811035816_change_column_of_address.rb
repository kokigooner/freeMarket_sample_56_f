class ChangeColumnOfAddress < ActiveRecord::Migration[5.0]
  def up
    change_column :addresses, :phone_number, :string
  end

  def down
    change_column :addresses, :phone_number, :integer
  end
end
