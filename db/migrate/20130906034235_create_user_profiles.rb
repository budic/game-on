class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string :nickname
      t.string :sms_phone
      t.integer :sms_carrier_cd
      t.timestamps
    end
    add_reference :user_profiles, :user, index: true
  end
end
