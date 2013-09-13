class AddReceventToEvent < ActiveRecord::Migration
  def change
    add_reference :events, :recurring_event, index: true
  end
end
