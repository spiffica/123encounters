require 'spec_helper'

describe "Encounters" do
	context "logged in user" do
		before do
			@user = FactoryGirl.create :user
			@user2 = FactoryGirl.create :user
			@contact = FactoryGirl.create(:contact, user:@user, first_name: "Telus")
			@contact2 = FactoryGirl.create(:contact, user:@user2, first_name: "Sandy")
			visit '/'
			fill_in 'Email', with: @user.email
			fill_in 'Password', with: @user.password
			click_button 'Sign in'
			click_link 'New Encounter'
		end
		describe "encounter" do
			it "add an encounter" do
				select('Telus', from: 'Contact') 
				select '30', from: 'encounter_duration'
				expect{ click_button 'Create Encounter' }.to change{Encounter.count}.
				by(1)
				current_path.should eq encounter_path 1
			end
			it "lists only current users contacts in form" do
				within "select#encounter_contact_id" do
					page.should_not have_content @contact2.first_name
				end
			end
			it "must assign a contact belonging to current_user" do
				click_button "Create Encounter"
				expect(page).to have_content("can't be blank")
			end
			it "must reload @contacts" do
				click_button "Create Encounter"
				expect(page).to have_css("select")
			end
			it "allows editing of encounter" do
				select @contact.first_name, from: 'Contact'
				select '20', from: 'Duration'
				click_button 'Create Encounter'
				expect(current_path).to eq encounter_path 1
				click_link 'edit'
				expect(current_path).to eq edit_encounter_path 1
				select '25', from: 'Duration'
				click_button 'Update Encounter'
				expect(Encounter.find(1).duration).to eq 25
			end
			it "allows deleting of encounter" do
				select @contact.first_name, from: 'Contact'
				select '20', from: 'Duration'
				click_button 'Create Encounter'
				
				expect{click_link 'delete'}.to change{Encounter.count}.by -1
			end
			it "displays all encounters" do
				select @contact.first_name, from: 'Contact'
				select '20', from: 'Duration'
				click_button 'Create Encounter'
				visit new_encounter_path
				select @contact.first_name, from: 'Contact'
				select '40', from: 'Duration'
				click_button 'Create Encounter'
				visit encounters_path
				expect(page).to have_css('div#encounters > div',count:2)
			end
		end
		describe "dialog" do
			it "displays dialog form on encounter#show" do
				select @contact.first_name, from: 'Contact'
				select '20', from: 'Duration'
				click_button 'Create Encounter'

				expect(current_path).to eq encounter_path 1
				expect(page).to have_css('form#new_dialog')
			end
		end
	end
end
