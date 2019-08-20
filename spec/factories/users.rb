FactoryBot.define do
  factory :user do
    nickname { "テストユーザー" }
    email {"test1@example.com"}
    password { "hoge1234" }
    password_confirmation { "hoge1234" }
    family_name { "メルカリ" }
    first_name { "太郎" }
    family_name_kana { "メルカリ" }
    first_name_kana { "タロウ" }
    birth_year { 1990 }
    birth_month { 10 }
    birth_day { 10 }
  end
end
