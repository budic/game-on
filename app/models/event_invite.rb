class EventInvite < ActiveRecord::Base
  attr_accessible :status, :event_id, :user_id
  as_enum :status, :yes => 0, :no => 1, :maybe => 2, :noanswer =>3
  belongs_to :event
  belongs_to :user
end
