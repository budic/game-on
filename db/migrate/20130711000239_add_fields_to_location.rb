class AddFieldsToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :name, :string
    add_column :locations, :address, :string
    add_column :locations, :latitude, :float
    add_column :locations, :longitude, :float
    add_column :locations, :phone_number, :string
    add_column :locations, :email, :string
    add_column :locations, :website, :string
  end
end
