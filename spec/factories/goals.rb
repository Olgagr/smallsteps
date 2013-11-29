require 'faker'

FactoryGirl.define do
  factory :goal do
    association :user
    title 'Yearly goal'
    description Faker::Lorem.paragraph
    year 2013
    type 'YearlyGoal'
  end
end
