FactoryGirl.define do
  factory :holiday do
    holiday_date Time.now
    name "MyString"
    description "MyText"
  end
end
