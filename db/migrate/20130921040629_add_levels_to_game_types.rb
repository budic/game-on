class AddLevelsToGameTypes < ActiveRecord::Migration
  def change
    add_column :game_types, :level1, :string
    add_column :game_types, :level2, :string
    add_column :game_types, :level3, :string
    add_column :game_types, :level4, :string
    add_column :game_types, :level5, :string
  end
end
