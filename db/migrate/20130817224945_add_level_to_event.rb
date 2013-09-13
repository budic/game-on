class AddLevelToEvent < ActiveRecord::Migration
  def change
    add_column :events, :level, :float
  end
end
