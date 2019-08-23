class ChangeColumnOfProducts < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :order_status, :boolean
    add_column :products, :buyer_id, :integer
  end
end
