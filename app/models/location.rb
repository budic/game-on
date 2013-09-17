class Location < ActiveRecord::Base
  attr_accessible :name, :email, :website, :longitude, :latitude, :address, :phone_number
  has_many :recurring_events, dependent: :destroy
  has_many :events, dependent: :destroy
  
  geocoded_by :address do |obj, results|
    if geo = results.first
      obj.address = geo.formatted_address
      obj.latitude = geo.latitude
      obj.longitude = geo.longitude
    end
  end
  before_validation :geocode, :if => :address_changed?
  
  validates_presence_of :name, :address
  validates_uniqueness_of :address, :case_sensitive => false
  
  
  def self.search(search)
    if search
      near( "%#{search}%", 20)
    else
      near( '92127', 20)
    end
  end
  
end
