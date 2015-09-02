FactoryGirl.define do
  factory :hero do

    trait :random do
      first_name { Faker::Name.first_name }
      last_name { Faker::Name.last_name }
      title  { Faker::Name.title + " of " + Faker::Commerce.department }
      bio { Faker::Lorem.paragraph(3) }
    end
  end
end
