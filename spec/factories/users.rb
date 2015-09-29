FactoryGirl.define do
  factory :user, class: User do
    user_name "MyString"
		about_me "MyText"
		location "MyString"
		sequence(:email) { |n| "user#{n}@pailplan.com"}
		password "password"
	end
end
