# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :goal do
    title "MyString"
    description "MyText"
    year 1
    month 1
    week 1
    finished false
  end
end
