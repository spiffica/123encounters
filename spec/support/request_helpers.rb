module TopicHelpers
	def sign_up
		visit new_user_registration_path
		fill_in "Email", with: "foo@bar.com"
		fill_in "user_password", with: "foobar"
		fill_in "Password confirmation", with: "foobar"
		click_button "Sign up"
	end
	def create_contact name
		click_button "New Contact"
		fill_in "First name", with: name
		click_button "Create Contact"
	end
	def create_topic topic
		click_button "New Topic"
		fill_in "Title", with: topic
	end
end 

RSpec.configure do |config|
	config.include TopicHelpers, type: :request
end
