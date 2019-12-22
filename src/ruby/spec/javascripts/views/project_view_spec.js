describe("AgileTracker.ProjectView", function() {

  beforeEach(function() {
    this.model = {};
    this.model.bind = sinon.stub();
    this.model.velocity = sinon.stub();
    this.model.velocityIsFake = sinon.stub();
    this.model.stories = {fetch: sinon.stub(), bind: sinon.stub()};
    AgileTracker.ProjectView.prototype.template = sinon.stub();
    this.view = new AgileTracker.ProjectView({model: this.model});
  });

  describe("addColumnView", function() {

    beforeEach(function() {
      this.columnView = {};
    });

    it("adds the column view", function() {
      this.view.addColumnView('column_id', this.columnView);
      expect(this.view.columns.column_id).toBe(this.columnView);
    });

  });

});
