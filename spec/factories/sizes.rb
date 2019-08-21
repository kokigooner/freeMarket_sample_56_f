FactoryBot.define do
  factory :size do
    size { "女性服" }
    size_category { FactoryBot.build(:size_category) }
  end
end
