# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :borrow do
    borrower_id 1
    item_id 1
    status "MyString"
    should_be_returned_at "2014-11-07 14:19:00"
  end
end
