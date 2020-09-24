FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'ab234C' }
    password_confirmation { password }
    first_name            { Gimei.name.first.kanji }
    last_name             { Gimei.name.last.kanji }
    first_name_kana       { Gimei.name.first.katakana }
    last_name_kana        { Gimei.name.last.katakana }
    birthday              { Faker::Date.in_date_period }
  end
end
