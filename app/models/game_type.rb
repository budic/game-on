class GameType < ActiveRecord::Base
  has_many :recurring_events
  has_many :events
  attr_accessible :name, :level1, :level2, :level3, :level4, :level5
end
