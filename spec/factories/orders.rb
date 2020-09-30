FactoryBot.define do
  factory :order_shipping do
    token { 'tok_ac0863ef819cf0125252de57b732' }
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    addresses { '1-1' }
    building { '東京ハイツ' }
    phone_number {'09012345678'}
  end
end
