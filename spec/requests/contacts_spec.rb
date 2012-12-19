require 'spec_helper'

describe "Contacts" do

	def add_contact
			click_link 'Add Contact'
  		fill_in 'First name', with: 'Jenny'
  		fill_in 'Last name', with: 'Wafer'
  		click_button 'Create Contact'
  end

  describe "signed in User" do
		before do
			@user = FactoryGirl.create :user
			visit root_path
			fill_in 'Email', with: @user.email
			fill_in 'Password', with: @user.password
			click_button 'Sign in'
			add_contact
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
	  context "when creating contact" do
		  specify "must enter a first name" do
		  	click_link 'Add Contact'
	  		fill_in 'Last name', with: 'Wafer'
		  	fill_in 'Email', with: "here@now.com"
	  		click_button 'Create Contact'

		  	expect{ click_button 'Create Contact'}.to_not change{Contact.count}	  		
	  		expect(page).to have_css(".required.error")
		  end
		  specify "may leave email blank" do 
		  	click_link 'Add Contact'
		  	fill_in 'First name', with: 'Trevor'

		  	expect{ click_button 'Create Contact'}.to change{Contact.count}.by(1)
		  end
		  specify "if email submitted, must be valid" do
		  	click_link 'Add Contact'
		  	fill_in 'First name', with: 'Trevor'
		  	bad_email = %w(this@.co fo.com fog@.com here@good.)
		  	bad_email.each do |email|
			  	expect{
			  		fill_in 'Email', with: email
			  		click_button 'Create Contact'
			  	}.to_not change{Contact.count}
			  end
		  end
		end
	end
end
