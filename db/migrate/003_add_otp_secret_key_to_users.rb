class AddOtpSecretKeyToUsers < Rails.version < '5.0' ? ActiveRecord::Migration : ActiveRecord::Migration[4.2]
  def up
    add_column :users, :otp_secret_key, :string
    User.find_each { |user| user.update_attribute(:otp_secret_key, ROTP::Base32.random_base32) }
  end

  def down
    remove_column :users, :otp_secret_key
  end
end
