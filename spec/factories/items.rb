FactoryBot.define do
  factory :item do
    name                        { Faker::Lorem.word }
    explanation                 { Faker::Lorem.sentence }
    category_id                 { Faker::Number.between(from: 2, to: 11) }
    status_id                   { Faker::Number.between(from: 2, to: 3) }
    delivery_fee_id             { Faker::Number.between(from: 2, to: 7) }
    shipment_prefecture_id      { Faker::Number.between(from: 2, to: 48) }
    shipment_day_id             { Faker::Number.between(from: 2, to: 4) }
    price                       { Faker::Number.between(from: 300, to: 9999999) }

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end
end
