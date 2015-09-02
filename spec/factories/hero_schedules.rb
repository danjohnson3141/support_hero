FactoryGirl.define do
  factory :hero_schedule do
    trait :today do
      scheduled_on Time.now
    end

    trait :tomorrow do
      scheduled_on 1.day.from_now
    end

    trait :random do
      hero { create(:hero, :random) }  
      scheduled_on { rand(-10...10).days.ago }
    end
  end

end
