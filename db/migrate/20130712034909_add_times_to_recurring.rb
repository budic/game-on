class AddTimesToRecurring < ActiveRecord::Migration
  def change
    add_column :recurring_events, :start_time, :time
    add_column :recurring_events, :end_time, :time
  end
end
