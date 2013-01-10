require 'spec_helper'


describe "Topics" do
	before :each do
		# include RequestHelpers
		sign_up #user
		click_link "New Encounter"
		# create encounter
		
	end
	it "successfully signs up new user", js: true do
		expect(current_path).to eql(new_encounter_path)
	end
	it "accepts title and background info in form", js: true do
		create_contact "jenny"
		click_button "Create Encounter"
		click_button "New Topic"
		fill_in "Title", with: "Junk Mail"
		# create_topic "Annoying shit"
		expect(page).to have_content("New topic")
		#this test hangs for 1 minute and shows Timeout error WTF!!
	end


	it "displays background data in #show"
	it "removes background div if no background data"
	it "has checkboxes of contacts involved in topic" do
		# create another contact
		# create another encounter
		# select same topic
	end
	it "filters dialogs by contacts selected"
end
