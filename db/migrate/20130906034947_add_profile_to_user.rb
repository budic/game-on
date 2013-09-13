class AddProfileToUser < ActiveRecord::Migration
  def change
    add_reference :users, :user_profile, index: false
  end
end
