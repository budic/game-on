class AddRemindersToEvents < ActiveRecord::Migration
  def change
    add_column :events, :hours_before_email, :integer
    add_column :events, :hours_before_sms, :integer
  end
end
