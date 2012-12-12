FactoryGirl.define do
	factory :user do
		sequence(:email) { |x| "user#{x}@example.com" } 
		password 'foobar'
	end
	factory :contact do
		sequence(:first_name) { |fn| "Contact#{fn}"} 
		user

		factory :bad_email do
			email 'none'
		end

	end

end
