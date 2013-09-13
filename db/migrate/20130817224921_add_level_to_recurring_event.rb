class AddLevelToRecurringEvent < ActiveRecord::Migration
  def change
    add_column :recurring_events, :level, :float
  end
end
