FactoryBot.define do
  factory :currency do
    code { Faker::Currency.code }
  end
end