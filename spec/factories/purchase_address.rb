FactoryBot.define do
  factory :purchase_address do
    postal_code      { '123-4567' }
    area_id          {Faker::Number.between(from: 2, to: 48)}
    city             {Faker::Address.city}
    house_number     {Faker::Address.street_address}
    house_name       {Faker::String.random}
    telephone_number {Faker::Number.number(digits: 10)}
  end
end
