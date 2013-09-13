class UpgradeDeviseTo2 < ActiveRecord::Migration
  def change
    add_column :users, :password_salt, :string
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :unconfirmed_email, :string
    add_column :users, :invitation_token, :string
  end
end
