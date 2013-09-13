class AddEventTypeToEvent < ActiveRecord::Migration
  def change
    add_column :events, :event_type_cd, :integer
  end
end
