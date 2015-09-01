FactoryGirl.define do
  factory :hero do
    sequence(:first_name) { |n| "First #{n}" }
    sequence(:last_name) { |n| "Last #{n}" }

    trait :random do
      first_name { Faker::Team.creature }
      last_name { Faker::Team.creature }
      title  { Faker::Team.creature.titleize }
      bio { Faker::Lorem.paragraph(3) }
    end
  end
end
