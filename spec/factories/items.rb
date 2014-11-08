# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    status "free"
    user_id 1
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence(20) }
  end
end
