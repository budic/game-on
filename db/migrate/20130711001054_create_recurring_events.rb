class CreateRecurringEvents < ActiveRecord::Migration
  def change
    create_table :recurring_events do |t|
      t.string :name

      t.timestamps
    end
  end
end
