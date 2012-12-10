require 'spec_helper'

describe "Contacts" do
	before do
		@user = FactoryGirl.create :user
		visit root_path
		fill_in 'Email', with: @user.email
		fill_in 'Password', with: @user.password
		click_button 'Sign in'
	end

  describe "signed in User" do
	  	before do
	  		click_link 'Add Contact'
	  		fill_in 'First name', with: 'Jenny'
	  		fill_in 'Last name', with: 'Wafer'
	  		click_button 'Create Contact'
	  	end
		  specify "can add a contact" do

		  	expect(page).to have_content('Jenny')
		  end
		  specify "can edit a contact" do
		  	within "table#contact_list" do 
		  		click_link "edit"
		  	end
		  	fill_in 'First name', with: 'Bethany'
		  	click_button "Update Contact"
		  	expect(page).to have_content('Bethany')
		  	# save_and_open_page

		  end
		  specify "can delete a contact" do
		  	click_link "delete"

		  	expect(page).not_to have_content("Wafer")
		  	expect(current_path).to eq(contacts_path)
		  	expect(Contact.count).to eq(0)
		  end
		  specify "must enter a first name when creating contact" do
		  	
		  end
		end
end
