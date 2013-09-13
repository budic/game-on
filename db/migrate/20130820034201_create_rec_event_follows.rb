class CreateRecEventFollows < ActiveRecord::Migration
  def change
    create_table :rec_event_follows do |t|

      t.timestamps
    end
  end
end
