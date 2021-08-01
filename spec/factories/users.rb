FactoryBot.define do
  factory ;user do
    nickname
    email
    password
    password_confirmation
    kanji_first_name
    kanji_last_name
    kana_first_name
    kana_last_name
    birthday
  end
end