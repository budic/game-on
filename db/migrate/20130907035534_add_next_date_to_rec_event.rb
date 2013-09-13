class AddNextDateToRecEvent < ActiveRecord::Migration
  def change
    add_column :recurring_events, :next_gen_date, :datetime
  end
end
