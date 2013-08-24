require 'faker'

FactoryGirl.define do
  factory :goal do
    title 'Yearly goal'
    description Faker::Lorem.paragraph
    year 2013
  end
end
