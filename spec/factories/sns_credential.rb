FactoryBot.define do
  factory :sns_credential do
    user{ FactoryBot.build(:user)}
    provider{'facebook'}
    uid{'12345'}
  end
end