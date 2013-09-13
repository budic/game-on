class GameType < ActiveRecord::Base
  has_many :recurring_events
  has_many :events
  attr_accessible :name
end
