# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_profile do
    nickname "MyString"
    sms_number 1
  end
end
