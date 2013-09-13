class AddRefsToEvent < ActiveRecord::Migration
  def change
    add_column :events, :location_id, :integer
    add_index :events, :location_id
    add_column :events, :game_type_id, :integer
    add_index :events, :game_type_id
  end
end
