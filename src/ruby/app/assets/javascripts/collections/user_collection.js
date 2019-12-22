if (typeof AgileTracker == 'undefined') {
  AgileTracker = {};
}

AgileTracker.UserCollection = Backbone.Collection.extend({
  model: AgileTracker.User,

  forSelect: function() {
    return this.map(function(user) {
      return [user.get('name'),user.id];
    });
  }
});
