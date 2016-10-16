class CreateNotes < ActiveRecord::Migration
  def self.up
    create_table :notes do |t|
      t.text :encrypted_note
      t.uuid :user_id
      t.uuid :story_id

      t.timestamps
    end
  end

  def self.down
    drop_table :notes
  end
end
