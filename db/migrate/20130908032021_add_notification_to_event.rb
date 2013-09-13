class AddNotificationToEvent < ActiveRecord::Migration
  def change
    add_column :events, :next_reminder_time, :datetime
    add_column :events, :next_reminder_type_cd, :integer
  end
end
