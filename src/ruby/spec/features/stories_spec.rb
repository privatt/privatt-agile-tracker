require 'rails_helper'

describe "Stories" do

  before(:each) do
    Capybara.default_max_wait_time = 5
    sign_in user
  end

  let(:user)  {
    FactoryGirl.create :user, :email => 'user@example.com',
                              :password => 'password'
  }

  let(:project) do
    FactoryGirl.create :project,  :name => 'Test Project',
                                  :users => [user]
  end

  # describe "full story life cycle" do
  #   before do
  #     project
  #     visit project_path(project)
  #   end

  #   it "should add a new story", js: true do
  #     click_on '+ Add story'

  #     within('#chilly_bin .story .edit-title') do
  #       fill_in 'title', with: 'New story'
  #     end

  #     within('#chilly_bin .story') do
  #       click_on 'Save'
  #     end

  #     find('#chilly_bin').should have_content('New story')

  #     within('#chilly_bin .story') do
  #       click_on '1'
  #     end

  #     find('#chilly_bin .story').should have_content('1')

  #     within('#chilly_bin .story') do
  #       click_on 'start'
  #     end

  #     find('#in_progress').should have_content('New story')

  #     within('#in_progress .story') do
  #       click_on 'finish'
  #       click_on 'deliver'
  #       click_on 'accept'
  #     end

  #     find('#in_progress .story.accepted .story-title').should have_content('New story')
  #   end
  # end

  # describe "delete a story" do

  #   let(:story) {
  #     FactoryGirl.create(:story, :title => 'Delete Me', :project => project,
  #                                 :requested_by => user)
  #   }

  #   before do
  #     story
  #   end

  #   it "deletes the story", :js => true do
  #     visit project_path(project)

  #     within(story_selector(story)) do
  #       find('.story-title').trigger 'click'
  #       click_on 'Delete'
  #     end

  #     page.should_not have_css(story_selector(story))
  #   end

  # end

  describe "show and hide columns" do

    before do
      project
      Capybara.ignore_hidden_elements = true
    end

    it "hides and shows the columns", :js => true do

      visit project_path(project)

      columns = {
        "done"        => "Done",
        "in_progress" => "In Progress",
        "backlog"     => "Backlog",
        "chilly_bin"  => "Chilly Bin"
      }

      columns.each do |column, button_text|
        selector = ".stories .#{column}_column"
        page.should have_css(selector)

        # Hide the column
        within('#column-toggles') do
          click_on button_text
        end
        page.should_not have_css(selector)

        # Show the column
        within('#column-toggles') do
          click_on button_text
        end
        page.should have_css(selector)

        # Hide the column with the 'close' button in the column header
        within("#{selector} .column_header") do
          click_link 'Close'
        end
        page.should_not have_css(selector)

      end
    end
  end

  def story_selector(story)
    "#story-#{story.id}"
  end

end
