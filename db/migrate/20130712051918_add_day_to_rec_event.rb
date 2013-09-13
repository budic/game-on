class AddDayToRecEvent < ActiveRecord::Migration
  def change
    add_column :recurring_events, :day, :integer
  end
end
