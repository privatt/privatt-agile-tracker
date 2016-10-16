class AddLabelsToStory < ActiveRecord::Migration
  def self.up
    add_column :stories, :encrypted_labels, :string
  end

  def self.down
    remove_column :stories, :labels
  end
end
