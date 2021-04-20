FactoryBot.define do
  factory :purchase_delivery_information do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    phone { '01010101010' }
  end
end
