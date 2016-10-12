class CreateProjectsUsers < ActiveRecord::Migration
  def self.up
    create_table :projects_users, :id => false do |t|
      t.uuid :project_id
      t.references :user
    end
  end

  def self.down
    drop_table :projects_users
  end
end
