class RecEventFollow < ActiveRecord::Base
  attr_accessible  :recurring_event_id, :user_id
  belongs_to :event
  belongs_to :user
end
