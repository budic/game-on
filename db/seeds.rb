# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
puts 'ROLES'

  Role.find_or_create_by_name :name => 'admin' 


puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role :admin
puts 'GAME TYPES'
v = GameType.find_or_create_by_name :name => "Indoor Volleyball"
puts 'type: ' << v.name
puts 'LOCATIONS'
loc = Location.find_or_create_by_address :name => "Carmel Mountain Ranch Rec Center", :address => 
"10152 Rancho Carmel Dr., San Diego"
loc = Location.find_or_create_by_address :name => "Twin Peaks Middle School", :address => 
"14640 Tierra Bonita, San Diego"
puts 'WEEKLY EVENTS'
ev = RecurringEvent.find_or_create_by_name :name => "Open Gym", :location_id => 1 , "game_type_id" => 1,
:day => 2, :start_time => '12:30', :end_time => '14:00'


