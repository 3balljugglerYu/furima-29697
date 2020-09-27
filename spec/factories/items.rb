FactoryBot.define do
  factory :item do
    name                  {Faker::Lorem.sentence}
    text                  {Faker::Lorem.sentence}
    category_id           {"1"}
    sales_status_id       {"1"}
    shipping_fee_status_id{"1"}
    prefecture_id         {"1"}
    scheduled_delivery_id {"1"}
    price                 {"500"}
    association :user 

    after(:build) do |test_image|
    test_image.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
