class AddReminderOptions < ActiveRecord::Migration
  def change
    add_column :event_invites, :send_email, :boolean
    add_column :event_invites, :send_sms, :boolean
    add_column :rec_event_follows, :send_email, :boolean
    add_column :rec_event_follows, :send_sms, :boolean
  end
end
