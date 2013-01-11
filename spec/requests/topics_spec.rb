require 'spec_helper'


describe "Topics" do
	before :each do
		# include RequestHelpers
		sign_up 
		visit new_topic_path
		fill_in "Title", with: "Bad Hair"
		visit new_encounter_path

		# create encounter
		
	end
	it "successfully signs up new user", js: true do
		expect(current_path).to eql(new_encounter_path)
	end
	it "accepts title and background info in form", js: true do
		visit new_topic_path
		fill_in "Title", with: "Bad Hair"
		fill_in "Background", with: "Reminiscing about all the bad hair of 
		the 80's"
		click_button "Create Topic"
		expect(Topic.count).to eql 1
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
