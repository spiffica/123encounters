require 'spec_helper'

describe "Users" do
	before do
		@user = FactoryGirl.create :user
		visit root_path
		fill_in 'Email', with: @user.email
		fill_in 'Password', with: 'foobar'
		click_button 'Sign in'
	end
	context "not signed in" do
		specify "arrive at sign_in page" do
			click_link 'logout'
			current_path.should == new_user_session_path
		end
	end
	context "signed in" do
	  specify "arrive at #show" do
			page.should have_content(@user.email)
	  end
	  specify "can add a contact" 


	end
end
