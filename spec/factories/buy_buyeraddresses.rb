FactoryBot.define do
  factory :buy_buyeraddress do
    post_code                  { '123-1234' }
    prefecture_id              { Faker::Number.between(from: 2, to: 48) }
    city                       { Faker::Name.initials(number: 2) }
    address                    { Faker::Name.initials(number: 2) }
    building_name              { Faker::Name.initials(number: 2) }
    phone_number               { '12312341234' }
    token                      { 'tok_abcdefghijk00000000000000000' }
  end
end
