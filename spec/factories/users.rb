FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
   end
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {"1a"+Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    kanji_first_name      {person.first.kanji}
    kanji_last_name       {person.last.kanji}
    kana_first_name       {person.first.katakana}
    kana_last_name        {person.last.katakana}
    birthday              {Faker::Date.birthday}
  end
end