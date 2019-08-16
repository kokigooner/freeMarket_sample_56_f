Product.create( 
  user_id: 1, 
  product_name: "hoge", 
  price: "100",
  content: "fugafuga", 
  deadline: "2016-03-22 08:52:03.92276#{n}", 
  charge_id: 1 
) 

t.references :user, foreign_key: true
t.string :product_name, null: false
t.integer :price, null: false
t.text :description, null: false
t.string :condition, null: false
t.string :delivery_charge, null: false
t.string :delivery_date, null: false
t.string :delivery_way, null: false
t.string :order_status