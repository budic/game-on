class RecEventFollow < ActiveRecord::Base
  attr_accessible  :recurring_event_id, :user_id
  belongs_to :recurring_event
  belongs_to :user
end
