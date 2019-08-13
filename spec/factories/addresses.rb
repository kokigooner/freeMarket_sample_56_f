FactoryBot.define do
  factory :address do
    family_name { "メルカリ" }
    first_name { "太郎" }
    family_name_kana { "メルカリ" }
    first_name_kana { "タロウ" }
    postal_code { "123-4567" }
    prefecture_id { 1 }
    minicipality { "東京都渋谷区" }
    address { "渋谷町 1-1-1" }
    building { "渋谷ビル" }
    phone_number { "000-1111-2222" }
  end
end
