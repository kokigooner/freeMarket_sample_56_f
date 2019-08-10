class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.integer :card_nubmer
      t.integer :varid_year
      t.integer :varid_month
      t.integer :cvc
      t.references :user, foreign_key: true
    end
  end
end
