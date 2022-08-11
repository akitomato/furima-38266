FactoryBot.define do
  factory :commodity do
    name                { Faker::Lorem.characters(number: 2) }
    detail              { Faker::Lorem.characters(number: 2) }
    category_id         { Faker::Number.between(from: 2, to: 11) }
    prefecture_id       { Faker::Number.between(from: 2, to: 48) }
    send_day_id         { Faker::Number.between(from: 2, to: 4) }
    condition_id        { Faker::Number.between(from: 2, to: 7) }
    delivery_charge_id  { Faker::Number.between(from: 2, to: 3) }
    price               { Faker::Number.between(from: 300, to: 999999999) }
    #association :user
    #association :buy

    after(:build) do |commodity|
      commodity.image.attach(io: File.open('public/images/test20220726-2.png'), filename: 'test_image.png')
    end
  end
end
