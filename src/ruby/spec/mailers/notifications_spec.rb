require 'rails_helper'

describe Notifications do

  let(:requested_by) { mock_model(User) }
  let(:owned_by) { mock_model(User) }
  let(:project) { mock_model(Project, :name => 'Test Project') }
  let(:story) do
    mock_model(Story, :title => 'Test story', :requested_by => requested_by,
                      :owned_by => owned_by, :project => project)
  end

  describe "#delivered" do

    let(:delivered_by) { mock_model(User, :name => 'Deliverer') }

    subject  { Notifications.delivered(story, delivered_by) }

    its(:subject) { should == "[Test Project] Your story 'Test story' has been delivered for acceptance." }
    its(:to)      { [requested_by.email] }
    its(:from)    { [delivered_by.email] }

    specify { subject.body.encoded.should match("Deliverer has delivered your story 'Test story'.") }
    specify { subject.body.encoded.should match("You can now review the story, and either accept or reject it.") }
    specify { subject.body.encoded.should match(project_url(project)) }

  end

  describe "#accepted" do

    let(:accepted_by) { mock_model(User, :name => 'Accepter') }

    subject  { Notifications.accepted(story, accepted_by) }

    its(:subject) { should == "[Test Project] Accepter ACCEPTED your story 'Test story'." }
    its(:to)      { [owned_by.email] }
    its(:from)    { [accepted_by.email] }

    specify { subject.body.encoded.should match("Accepter has accepted the story 'Test story'.") }
    specify { subject.body.encoded.should match(project_url(project)) }

  end

  describe "#rejected" do

    let(:rejected_by) { mock_model(User, :name => 'Rejecter') }

    subject  { Notifications.rejected(story, rejected_by) }

    its(:subject) { should == "[Test Project] Rejecter REJECTED your story 'Test story'." }
    its(:to)      { [owned_by.email] }
    its(:from)    { [rejected_by.email] }

    specify { subject.body.encoded.should match("Rejecter has rejected the story 'Test story'.") }
    specify { subject.body.encoded.should match(project_url(project)) }

  end

  describe "#new_note" do
    let(:notify_users) do
      [FactoryGirl.create(:user, :email => 'foo@example.com', :password => 'password')]
    end

    let(:user) do
      FactoryGirl.create :user, :email => 'user_note@example.com',
                                :password => 'password',
                                :name => 'Note User'
    end

    let(:note_project) do
      FactoryGirl.create :project,  :name => 'Test Project',
                                    :users => [user]
    end

    let(:note_story) do
      FactoryGirl.create :story,  :title => 'Test Story',
                                  :state => 'started',
                                  :project => note_project,
                                  :requested_by => user
    end

    let(:note) do
      FactoryGirl.create :note, :user => user,
                                :story => note_story,
                                :note => 'Test Note Content'
    end

    subject { Notifications.new_note(note, notify_users) }

    its(:subject) { should == "[Test Project] New comment on 'Test Story'" }
    its(:to)      { ['foo@example.com'] }
    its(:from)    { [user.email] }

    specify { subject.body.encoded.should match("Note User added the following comment to the story") }

    DatabaseCleaner.clean
  end
end
