class Note < ActiveRecord::Base
  # Encrypted Attributes
  attr_encrypted :note, random_iv: true

  JSON_ATTRIBUTES = [
    "created_at", "errors", "id", "note", "story_id", "updated_at", "user_id"
  ]
  JSON_METHODS = [
    "errors"
  ]

  belongs_to :user
  belongs_to :story

  after_save :create_changeset

  validates :note, :presence => true

  # FIXME move to observer
  def create_changeset
    story.changesets.create!

    unless story.project.suppress_notifications
      # Notify all stakeholders in the story, but not the user who made the
      # note.
      notify_users = story.notify_users
      notify_users.delete(user)

      Notifications.new_note(self, notify_users).deliver unless notify_users.empty? || user.nil?
    end
  end

  # Defines the attributes and methods that are included when calling to_json
  def as_json(options = {})
   json = super(:only => JSON_ATTRIBUTES, :methods => JSON_METHODS)
   note = json["note"]
   note = note.reverse_merge("note" => self.note)
   json["note"] = note
   json
  end

  def to_s
    note_string = note
    user_name = user ? user.name : I18n.t('author unknown')
    created_date = I18n.l created_at, :format => :note_date
    note_string = note_string + " (" + user_name + " - " + created_date + ")"
  end
end
