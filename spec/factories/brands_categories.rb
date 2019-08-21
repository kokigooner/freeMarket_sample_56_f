FactoryBot.define do
  factory :brands_category do
    id{'1'}
    brand{FactoryBot.build(:brand)} 
    first_category{FactoryBot.build(:first_category)}
  end
end
