class AddInvitesToTables < ActiveRecord::Migration
  def change
    add_reference :events, :event_invite, index: true
    add_reference :users, :event_invite, index: true
  end
end
