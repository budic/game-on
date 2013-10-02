class RecEventFollow < ActiveRecord::Base
  attr_accessible  :recurring_event_id, :user_id, :send_email, :send_sms
  belongs_to :recurring_event
  belongs_to :user
end
