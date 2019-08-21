FactoryBot.define do
  factory :third_category do
    third_category { "Tシャツ/カットソー(半袖/袖なし)" }
    second_category { FactoryBot.build(:second_category) }
  end
end

