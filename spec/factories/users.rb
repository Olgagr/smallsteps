FactoryGirl.define do
  factory :user do
    username Faker::Internet.email
    password Faker::Lorem.characters(8)
  end
end
