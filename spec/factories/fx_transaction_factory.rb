FactoryBot.define do
  factory :fx_transaction do
    identifier { SecureRandom.uuid }
    in_amount { 10_000.00 }
    in_currency { FactoryBot.create(:currency)}
    out_amount { 9500.00 }
    out_currency { FactoryBot.create(:currency)}
    customer { FactoryBot.create(:customer) }
  end
end