class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users, id: :uuid do |t|
      # t.database_authenticatable :null => false
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      # t.recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      # t.rememberable
      t.string   :remember_token
      t.datetime :remember_created_at

      # t.trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :encrypted_current_sign_in_ip
      t.string   :encrypted_last_sign_in_ip

      # t.confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      # t.encryptable
      t.string :password_salt

      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    add_index :users, :confirmation_token,   :unique => true
  end

  def self.down
    drop_table :users
  end
end
