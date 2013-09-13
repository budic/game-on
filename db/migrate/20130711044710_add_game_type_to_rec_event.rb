class AddGameTypeToRecEvent < ActiveRecord::Migration
  def change
    add_reference :recurring_events, :game_type, index: true
  end
end
