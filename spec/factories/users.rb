FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    sequence(:username) { |n| "#{Faker::Internet.username(specifier: 3..12)}_#{n}" }
    bio { Faker::Lorem.paragraph }
    phone_number { Faker::PhoneNumber.cell_phone }
  end
end
