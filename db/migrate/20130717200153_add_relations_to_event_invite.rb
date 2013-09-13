class AddRelationsToEventInvite < ActiveRecord::Migration
  def change
    add_reference :event_invites, :user, index: true
    add_reference :event_invites, :event, index: true
  end
end
