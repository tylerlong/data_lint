# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :snippet do
    content "MyText"
    valid false
  end
end
