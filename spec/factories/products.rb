FactoryBot.define do
  factory :product do
    user_id { '1' }
    product_name { 'テストプロダクト' }
    price { 'test@exa' } 
    description { 'testtest' }
    first_category { "1" }
    second_category_id { '1' }
    third_category_id { '1' }
    brand_id { '1' }
    size_id { 'M' }
    condition { 'size_id' }
    delivery_charge{"送料込み(出品者負担)"}
    delivery_date{"1~2日で発送"}
    delivery_way{"らくらくメルカリ便"}
    order_id{"1"}
    profit_id{"1"}
    order_status{"1"}
  end
end


