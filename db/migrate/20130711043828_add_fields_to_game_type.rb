class AddFieldsToGameType < ActiveRecord::Migration
  def change
    add_column :game_types, :name, :string
  end
end
