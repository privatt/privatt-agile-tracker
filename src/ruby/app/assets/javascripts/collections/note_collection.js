if (typeof AgileTracker == 'undefined') {
  AgileTracker = {};
}

AgileTracker.NoteCollection = Backbone.Collection.extend({
  model: AgileTracker.Note,

  url: function() {
    return this.story.url() + '/notes';
  },

  saved: function() {
    return this.reject(function(note) {
      return note.isNew();
    });
  }
});
