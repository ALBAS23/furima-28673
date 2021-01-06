FactoryBot.define do
  factory :purchase_form do
    address = Gimei.address
    postal_code                 { '359-5678' }
    shipment_prefecture_id      { Faker::Number.between(from: 2, to: 48) }
    municipality                { address.city.kanji }
    address                     { address.town.kanji }
    building                    { '青山ビル' }
    phone_number                { Faker::Number.number(digits: 11) }
    token                       { 'tok_9883c52b4524f2fac44239550000' }
  end
end
