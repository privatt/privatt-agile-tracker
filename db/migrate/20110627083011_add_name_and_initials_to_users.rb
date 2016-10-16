class AddNameAndInitialsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :encrypted_name, :string
    add_column :users, :encrypted_initials, :string
  end

  def self.down
    remove_column :users, :encrypted_name
    remove_column :users, :encrypted_initials
  end
end
