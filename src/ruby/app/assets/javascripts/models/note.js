if (typeof AgileTracker == 'undefined') {
  AgileTracker = {};
}

AgileTracker.Note = Backbone.Model.extend({
  name: 'note',
  i18nScope: 'activerecord.attributes.note',
  timestampFormat: 'd mmm yyyy, h:MMtt',

  user: function() {
    var userId = this.get('user_id');
    return this.collection.story.collection.project.users.get(userId);
  },

  userName: function() {
    var user = this.user();
    return user ? user.get('name') : 'Author unknown';
  },

  created_at: function() {
    var date = new Date(this.get('created_at'));
    return date.format(this.timestampFormat);
  },
});

_.defaults(AgileTracker.Note.prototype, AgileTracker.SharedModelMethods);
