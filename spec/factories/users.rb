FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number: 2)}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 4)+"1a"}
    password_confirmation {password}
    first_name {Gimei.first.kanji}
    last_name {Gimei.last.kanji}
    kana_first_name {Gimei.first.katakana}
    kana_last_name {Gimei.last.katakana}
    birthday {Faker::Date.between(from: '1930-01-01', to: '2016-12-31')}
  end
end