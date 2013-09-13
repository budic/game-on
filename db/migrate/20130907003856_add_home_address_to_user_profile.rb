class AddHomeAddressToUserProfile < ActiveRecord::Migration
  def change
    add_column :user_profiles, :home_address, :string
  end
end
