# Product.create( 
#   user_id: 1, 
#   product_name: "hoge", 
#   price: "100",
#   content: "fugafuga", 
#   deadline: "2016-03-22 08:52:03.92276#{n}", 
#   charge_id: 1 
# ) 

# t.references :user, foreign_key: true
# t.string :product_name, null: false
# t.integer :price, null: false
# t.text :description, null: false
# t.string :condition, null: false
# t.string :delivery_charge, null: false
# t.string :delivery_date, null: false
# t.string :delivery_way, null: false
# t.string :order_status


# 以下は、カテゴリ機能実装に際して、サンプルカテゴリならびにサンプル商品を作成するためのコードです。
5.times do |num|
  FirstCategory.find_or_create_by!(
    first_category: "大カテゴリ#{num}"
  )
end

first_categories = FirstCategory.all
first_categories.each do |first_category|
  5.times do |num|
    SecondCategory.find_or_create_by!(
      first_category_id: first_category.id,
      second_category: "中カテゴリ#{num}"
    )
  end
end

second_categories = SecondCategory.all
second_categories.each do |second_category|
  5.times do |num|
    ThirdCategory.find_or_create_by!(
      second_category_id: second_category.id,
      third_category: "小カテゴリ#{num}"
    )
  end
end
