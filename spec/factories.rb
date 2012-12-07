FactoryGirl.define do
	factory :user do
		email 'trevor@trevor.com'
		password 'foobar'
	end
	factory :contact do
		sequence(:first_name) { |fn| "Airlie#{fn}"} 
		user

		factory :bad_email do
			email 'none'
		end

	end

end
