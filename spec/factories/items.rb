FactoryBot.define do
  factory :item do
    name                   { '販売、Sale,ヤス' }
    description            { Faker::Lorem.sentence }
    category_id            { 1 }
    condition_id           { 2 }
    price                  { Faker::Number.number(digits: 6) }
    postage_id             { 1 }
    day_to_ship_id         { 2 }
    prefecture_id          { 10 }
    id                      {1}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/logo.png'), filename: 'logo.png')
    end
  end
end
