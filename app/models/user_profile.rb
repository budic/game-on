class UserProfile < ActiveRecord::Base
  attr_accessible :user_id, :sms_number, :sms_carrier, :home_address, :nickname
  as_enum :sms_carrier, :att => 0, :verizon => 1
  belongs_to :user
end
