class Event < ActiveRecord::Base
  attr_accessible :name, :start_date, :end_date, :is_private, :location_id, :game_type_id, :event_type, :level, :next_reminder_time, :private
  as_enum :event_type, :game => 0, :practice => 1, :scrimmage => 2, :open => 3
  as_enum :next_reminder_type, :email => 0, :sms => 1
  belongs_to :location
  belongs_to :game_type
  has_one :recurring_event
  has_many :event_invites, dependent: :destroy
  has_many :users, through: :event_invites
  has_many :event_comments, dependent: :destroy
  
  reverse_geocoded_by "locations.latitude", "locations.longitude"
   
  
  def hasInvite?( userId )
    ev = EventInvite.find_by_user_id( userId  )
    if ev
      true
    else
      false
    end
  end
  
end
