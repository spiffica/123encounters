FactoryGirl.define do
	factory :user do
		sequence(:email) { |x| "user#{x}@example.com" } 
		password 'foobar'
		password_confirmation 'foobar'
	end
	factory :contact do
		sequence(:first_name) { |fn| "Contact#{fn}"} 
		user

		factory :bad_email do
			email 'none'
		end
	end
	factory :encounter do
		contact
		user
	end
	factory :topic do
		user
		sequence(:title) { |t| "Topic#{t}"}
	end
	factory :dialog do
		sequence(:content) { |c| "Content#{c}"}
		encounter
		topic
	end
end
 