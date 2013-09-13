class CreateGameTypes < ActiveRecord::Migration
  def change
    create_table :game_types do |t|

      t.timestamps
    end
  end
end
