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

	context "with valid credentials" do
		before do
			fill_in 'Email', with: @user.email
			fill_in 'Password', with: 'foobar'
			click_button 'Sign in'
		end
	  specify "arrive at #show" do
			expect(page).to have_content(@user.email)
	  end
	  specify "can add a contact" do
  		click_link 'Add Contact'
  		fill_in 'First name', with: 'Jenny'
  		fill_in 'Last name', with: 'Wafer'
  		click_button 'Create Contact'

	  	expect(page).to have_content('Jenny')
	  end
	end
end
