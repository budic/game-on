class AddRecEventToLocation < ActiveRecord::Migration
  def change
    add_reference :recurring_events, :location, index: true
  end
end
