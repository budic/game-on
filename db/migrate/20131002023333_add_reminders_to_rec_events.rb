class AddRemindersToRecEvents < ActiveRecord::Migration
  def change
    add_column :recurring_events, :hours_before_email, :integer
    add_column :recurring_events, :hours_before_sms, :integer
  end
end
