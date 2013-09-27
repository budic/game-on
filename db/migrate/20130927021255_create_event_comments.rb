class CreateEventComments < ActiveRecord::Migration
  def change
    create_table :event_comments do |t|
      t.string :comment
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
  end
end
