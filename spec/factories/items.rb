FactoryGirl.define do
  factory :item, class: Item do
    name "MyString"
		description "MyString"
		category "MyString"
		likes 1
		incomplete false
  end

end
