require 'spec_helper'

describe "Users" do
	before do
		@user = FactoryGirl.create :user
		visit root_path
	end
	context "not signed in" do
		specify "arrive at sign_in page" do
	  	expect(current_path).to eq(new_user_session_path)
		end
	end
	context "with invalid credentials" do
		before do
			fill_in 'Email', with: 'bad_email'
			fill_in 'Password', with: 'foobar'
			click_button 'Sign in'
		end
	  specify "arrive at sign_in page" do
	  	expect(current_path).to eq(new_user_session_path)
	  end
	end

	context "signed in" do
		before do
			fill_in 'Email', with: @user.email
			fill_in 'Password', with: 'foobar'
			click_button 'Sign in'
		end
	  specify "arrive at #show" do
			expect(page).to have_content(@user.email)
	  end
	  describe "crud actions ->" do
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
		  end
			specify "can create an encounter" do
				pending
				click_link "Add Encounter"
				fill_in 
			end
		end

		# begin planning; site backend wired up

		# user is signed in and on 

	end
end
