class AddRelationsToRecFollow < ActiveRecord::Migration
  def change
    add_reference :rec_event_follows, :user, index: true
    add_reference :rec_event_follows, :recurring_event, index: true
  end
end
