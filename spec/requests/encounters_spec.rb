require 'spec_helper'

describe "Encounters" do
	context "with logged in user" do
		before do
			@user = FactoryGirl.create :user
			@contact = FactoryGirl.create(:contact, user:@user, first_name: "Telus")
			visit '/'
			fill_in 'Email', with: @user.email
			fill_in 'Password', with: @user.password
			click_button 'Sign in'
			click_link 'New Encounter'
		end
		it "is the right user" do
			expect(@user).to equal(@user)
			expect(@contact.first_name).to eq("Telus")
			expect(@contact.user).to eq(@user)
			# save_and_open_page
		end
		it "can add an encounter" do
			select('Telus', from: 'Contact') 
			fill_in 'Subject', with: 'New phone contract'
			select '30', from: 'encounter_duration'
			fill_in 'Dialog', with: 'Unlimited data and voice for $99'
			

			expect{click_button 'Create Encounter'}.to change{
				Encounter.count}.by(1)
		end
	end
end
