class RecurringEvent < ActiveRecord::Base
  belongs_to :location
  belongs_to :game_type
  has_many :events
  attr_accessible :name, :location_id, :game_type_id, :start_time, :end_time, :day, :level, :hours_before_email, :hours_before_sms
  reverse_geocoded_by "locations.latitude", "locations.longitude"
  validates_presence_of :name, :location_id, :start_time, :end_time, :day, :game_type_id
  validates :level, :numericality => { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 5 }
  validates :game_type, :presence => true
  validates :game_type, :associated => true
end
