class RemovePhonenumberFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :phone_number, :integer
  end
end
