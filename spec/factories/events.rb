# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "MyString"
    start_date "2013-07-16 01:19:06"
    end_date "2013-07-16 01:19:06"
    is_private false
  end
end
