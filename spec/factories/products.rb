FactoryBot.define do
  factory :product do
    user { FactoryBot.build(:user) }
    # id{'1'}
    # user_id{'1'}
    product_name{'テストプロダクト'}
    price{'1000'}
    description{'testtest'} 
    # first_category {FactoryBot.build(:second_category)}
    # second_category {FactoryBot.build(:second_category)}
    # third_category {FactoryBot.build(:third_category)}
    # brand {FactoryBot.build(:brand)}
    # size {FactoryBot.build(:size)}
    condition{'悪い'}
    delivery_charge{"送料込み(出品者負担)"}
    delivery_date{"1~2日で発送"}
    delivery_way{"らくらくメルカリ便"}
    # order_id{"1"}
    # profit_id{"1"}
    order_status{"1"}
    prefecture_id{"1"}


    trait :skip_validate do
      to_create {|instance| instance.save(validate: false)}

   end

  end

end