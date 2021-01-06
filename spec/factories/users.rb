FactoryBot.define do
  factory :user do
    nickname                    { Faker::Internet.username }
    email                       { Faker::Internet.email }
    password                    { "12abi345" }
    password_confirmation       { password }
    last_name                   { Gimei.name.last.kanji }
    first_name                  { Gimei.name.first.kanji }
    last_name_kana              { Gimei.name.last.katakana }
    first_name_kana             { Gimei.name.first.katakana }
    birth                       { Faker::Date.birthday(min_age: 0, max_age: 100) }
  end
end
