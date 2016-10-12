class CreateStories < ActiveRecord::Migration
  def self.up
    create_table :stories, id: :uuid do |t|
      t.string :title
      t.text :description
      t.integer :estimate
      t.string :story_type, :default => 'feature'
      t.string :state, :default => 'unstarted'
      t.date :accepted_at
      t.uuid :requested_by_id
      t.uuid :owned_by_id
      t.uuid :project_id

      t.timestamps
    end
  end

  def self.down
    drop_table :stories
  end
end
