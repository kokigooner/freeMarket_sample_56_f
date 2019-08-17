FactoryBot.define do
  factory :card do
    customer { "cus_9735caff3170f34d5c534cc72c90" }
    card { "car_cdd34bed22153e06cdf645471872" }
    user { FactoryBot.create :user }
  end
end
