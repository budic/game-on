class CreateEventInvites < ActiveRecord::Migration
  def change
    create_table :event_invites do |t|
      t.integer :status_cd

      t.timestamps
    end
  end
end
