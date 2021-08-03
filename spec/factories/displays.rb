FactoryBot.define do
  factory :display do
    display_name {Faker::Name.initials}
    instruction  {Faker::Lorem.sentences}
    genre_id     {Faker::Number.between(from: 2, to: 11)}
    status_id    {Faker::Number.between(from: 2, to: 7)}
    load_id      {Faker::Number.between(from: 2, to: 3)}
    area_id      {Faker::Number.between(from: 2, to: 48)}
    day_id       {Faker::Number.between(from: 2, to: 4)}
    price        {Faker::Number.between(from: 300, to: 9999999)}
    association :user

    after(:build) do |display|
      display.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
